/* Your code here! */
#include "maze.h"
#include <map>
#include <queue>
#include <cmath>
#include <stack> 
#include <algorithm>


SquareMaze::SquareMaze(){
    maze_ = new vector<Node>;
	djset_ = new DisjointSets(); 
	width_ = 0;
	height_ = 0;
}

SquareMaze::~SquareMaze(){
    deleteHelp();
}

void SquareMaze::deleteHelp(){
    delete maze_;
    maze_ = NULL;
    delete djset_;
    djset_ = NULL;
}

void SquareMaze::makeMaze(int height, int width){
    if(maze_->size() > 0) deleteHelp();
    width_ = width;
    height_ = height;
    int mazeSize = width*height; 
    djset_->addelements(mazeSize);

    for(int i = 0; i < height * width; i++){
        maze_->push_back(Node(true, true));
    }

    for (int i = 0; i < width * height; i++) {
		vector<int> validDirections;
        //check boundary conditions and then check for cycles using disjoint sets
        int x = i % width_;
        int y = i / width_;
        if(((i + 1) % width_  != 0) && djset_->find(i) != djset_->find(i+1)) validDirections.push_back(0); //right
        if((i < width_ * (height_ - 1)) && djset_->find(i) != djset_->find(i+width_)) validDirections.push_back(1); //down
        if((i % width_ != 0) && djset_->find(i) != djset_->find(i-1)) validDirections.push_back(2); //left
        if((i >= width_) && djset_->find(i) != djset_->find(i-width_)) validDirections.push_back(3); //up
        
		// Random direction choice
		if (validDirections.size() == 0) continue;
		int randDir = validDirections[rand() % validDirections.size()];
        
        if(randDir == 0) {(*maze_)[i].right_ = false; djset_->setunion(i, i + 1);} //right
        if(randDir == 1) {(*maze_)[i].down_ = false; djset_->setunion(i, i + width_);} //down
        if(randDir == 2) {(*maze_)[i-1].right_ = false; djset_->setunion(i, i - 1);} //left
        if(randDir == 3) {(*maze_)[i-width_].down_ = false; djset_->setunion(i, i - width_);} //up
	}
}

bool SquareMaze::canTravel(int x, int y, int dir) const{
    int idx = x + y*width_;
    if(dir == 0 && x < width_ - 1) return !(*maze_)[idx].right_; //right
    if(dir == 1 && y < height_ - 1) return !(*maze_)[idx].down_; //down
    if(dir == 2 && x > 0) return !(*maze_)[idx - 1].right_; //left
    if(dir == 3 && y > 0) return !(*maze_)[idx - width_].down_; //up
    return false;
}

void SquareMaze::setWall(int x, int y, int dir, bool exists){
    //sets right/down wall to false. And then connects the 2 nodes
    int idx = x + y*width_;
    if(dir == 0) (*maze_)[idx].right_ = exists;
	if(dir == 1) (*maze_)[idx].down_ = exists;

}

vector<int> SquareMaze::solveMaze(){
    map<int, int> path;
    queue<int> queue;
    vector<int> lastRow;
    vector<bool> visited (height_ * width_, false);
    visited[0] = true;
    queue.push(0);

    while(!queue.empty()){
        int i = queue.front();
        int x = i % width_;
        int y = i / width_;
        queue.pop();

        if (y == height_ - 1) lastRow.push_back(i);
        
        if(canTravel(x, y, 0) && !visited[i + 1]) {queue.push(i + 1); visited[i + 1] = true; path[i + 1] = i;} //right
        if(canTravel(x, y, 1) && !visited[i + width_]) {queue.push(i + width_); visited[i + width_] = true; path[i + width_] = i;} //down
        if(canTravel(x, y, 2) && !visited[i - 1]) {queue.push(i - 1); visited[i - 1] = true; path[i - 1] = i;} //left
        if(canTravel(x, y, 3) && !visited[i - width_]) {queue.push(i - width_); visited[i - width_] = true; path[i - width_] = i;} //up
    }

    // vector<int> dirToLongestPath;
    // for(unsigned long i = 0; i < lastRow.size(); i++){
    //     int currIdx = lastRow[i];
    //     int prevIdx = path[currIdx];
    //     vector<int> tempPath;

    //     while (prevIdx) {
    //         if (prevIdx == currIdx + 1) tempPath.push_back(2); 
    //         else if (prevIdx == currIdx + width_) tempPath.push_back(3);
    //         else if (prevIdx == currIdx - 1) tempPath.push_back(0);
    //         else if (prevIdx == currIdx - width_) tempPath.push_back(1);
    //         currIdx = prevIdx;
    //         prevIdx = path[currIdx];
    //     }

    //     if(tempPath.size() > dirToLongestPath.size()) dirToLongestPath = tempPath;
    // }

    // dirToLongestPath.push_back(1);

    // reverse(dirToLongestPath.begin(),dirToLongestPath.end());
    // return dirToLongestPath;

    vector<int> directions;
    int lastIdx = width_ - 1;
    while(lastRow[lastIdx] == lastRow[lastIdx - 1]) lastIdx -= 1;

    int prevIdx = lastRow[lastIdx];
    while (prevIdx) {
        int currIdx = path[prevIdx];
        if (prevIdx == currIdx + 1) directions.push_back(0);
        else if (prevIdx == currIdx - 1) directions.push_back(2);
        else if (prevIdx == currIdx + width_) directions.push_back(1);
        else if (prevIdx == currIdx - width_) directions.push_back(3);
        prevIdx = currIdx;
    }
    reverse(directions.begin(),directions.end());
    return directions;
}

PNG * SquareMaze::drawMaze() const{
    PNG * maze = new PNG(width_*10 + 1, height_*10 + 1);

    for(int x = 0; x < width_; x++){
        for(int y = 0; y < height_; y++){
            //upmost edge is set to black
            if(!y){
                for(int z = 0; z < 11; z++){
                    HSLAPixel & curPixel = maze->getPixel(x*10+z, 0); curPixel.l = 0;
                }
            }

            //leftmost edge is set to black
            if(!x){
                for(int z = 0; z < 11; z++){
                    HSLAPixel & curPixel = maze->getPixel(0, y*10+z); curPixel.l = 0;
                }
            }

            //right
            if(!canTravel(x, y, 0)){
                for(int z = 0; z < 11; z++){
                    HSLAPixel & curPixel = maze->getPixel((x+1)*10, y*10 + z); curPixel.l = 0;
                }
            }

            //down
            if(!canTravel(x, y, 1)){
                for(int z = 0; z < 11; z++){
                    HSLAPixel & curPixel = maze->getPixel(x*10 + z, (y+1)*10); curPixel.l = 0;
                }
            }
        }
    }

    for(int i = 1; i < 10; i++){
        HSLAPixel & curPixel = maze->getPixel(i, 0); curPixel.l = 1;
    }

    return maze;
}

PNG * SquareMaze::drawMazeWithSolution(){
    PNG * maze = drawMaze();
    vector<int> answer = solveMaze();
    HSLAPixel red(0, 1, 0.5, 1);
    unsigned int currX = 5;
    unsigned int currY = 5;

    for (unsigned long idx = 0; idx < answer.size(); idx++) {
        if(answer[idx] == 0){
            for (int i = 0; i < 11; i++) {
                maze->getPixel(currX + i, currY) = red;
            }
            currX += 10;
        } else if(answer[idx] == 1){
            for (int i = 0; i < 11; i++) {
                maze->getPixel(currX, currY + i) = red;
            }
            currY += 10;
        } else if (answer[idx] == 2){
            for (int i = 0; i < 11; i++) {
                maze->getPixel(currX - i, currY) = red;
            }
            currX -= 10;
        } else if (answer[idx] == 3){
            for (int i = 0; i < 11; i++) {
                maze->getPixel(currX, currY - i) = red;
            }
            currY -= 10;
        }
    }
    
    unsigned int x = (currX - 5) / 10;
    unsigned int y = (currY - 5) / 10;
    for (int i = 1; i <= 9; i++) {
        maze->getPixel(x * 10 + i, (y + 1) * 10) = HSLAPixel(0, 0, 1, 1);
    }
    return maze;
}