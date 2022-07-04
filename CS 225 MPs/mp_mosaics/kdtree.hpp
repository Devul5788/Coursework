/**
 * @file kdtree.cpp
 * Implementation of KDTree class.
 */

#include <utility>
#include <algorithm>

using namespace std;

template <int Dim>
bool KDTree<Dim>::smallerDimVal(const Point<Dim>& first, const Point<Dim>& second, int curDim) const {
  if(curDim < 0 || curDim >= Dim) return false;
  if(first[curDim]==second[curDim]) return first < second;
  return first[curDim] < second[curDim];
}

template <int Dim>
bool KDTree<Dim>::shouldReplace(const Point<Dim>& target, const Point<Dim>& currentBest, const Point<Dim>& potential) const{
  double potDist = squaredDist(target, potential); 
  double currDist = squaredDist(target, currentBest); 
  if(potDist==currDist) return potential < currentBest;
  if(potDist < currDist) return true;
  return false;
}

template <int Dim>
double KDTree<Dim>::squaredDist(const Point<Dim>& p1, const Point<Dim>& p2) const {
  double dist = 0;
  for(int i = 0; i < Dim; i++){
    dist += (p1[i]-p2[i]) * (p1[i]-p2[i]);
  }

  return dist;
}

template <int Dim>
int KDTree<Dim>::partition(vector<Point<Dim>>& newPoints, int dim, int left, int right, int pivotIndex){
  Point<Dim> pivotVal = newPoints [pivotIndex];
  Point<Dim> temp = pivotVal;
  newPoints[pivotIndex] = newPoints[right];
  newPoints[right] = temp;
  int storeIndex = left;
  for(int i = left; i < right; i++){
    if(smallerDimVal(newPoints[i], pivotVal, dim)){
      temp = newPoints[storeIndex];
      newPoints[storeIndex] = newPoints[i];
      newPoints[i] = temp; 
      storeIndex++;
    }
  }
  temp = newPoints[storeIndex];
  newPoints[storeIndex] = newPoints[right];
  newPoints[right] = temp;
  return storeIndex;
}

//Finds the Kth smallest value
template <int Dim>
Point<Dim> KDTree<Dim>::select(vector<Point<Dim>>& newPoints, int dim, int left, int right, int k){
  while (left <= right) {
    if(left == right) return newPoints[left];
    int pivotIndex = partition(newPoints, dim, left, right, k);
    if(k == pivotIndex) return newPoints[k];
    else if (k < pivotIndex) right = pivotIndex - 1;
    else left = pivotIndex + 1;
  }
  return NULL;
}

template <int Dim>
typename KDTree<Dim>::KDTreeNode* KDTree<Dim>::buildTree(vector<Point<Dim>>& newPoints, int dim, int left, int right){
  if(newPoints.size() != 0 && left >= 0 && (unsigned long) right <  newPoints.size() && left <= right){
    int middle = (left + right)/2;
    KDTreeNode * rootNew = new KDTreeNode(select(newPoints, dim, left, right, middle));
    rootNew->left = buildTree(newPoints, (dim + 1)%Dim, left, middle - 1);
    rootNew->right = buildTree(newPoints, (dim + 1)%Dim, middle + 1, right);
    return rootNew;
  }
  return NULL;
}

template <int Dim>
KDTree<Dim>::KDTree(const vector<Point<Dim>>& newPoints){
  if(newPoints.size() == 0) root = NULL;
  size = newPoints.size();
  vector<Point<Dim>> copy;
  copy.assign(newPoints.begin(), newPoints.end());
  root = buildTree(copy, 0, 0, copy.size()-1);
}

template <int Dim>
KDTree<Dim>::KDTree(const KDTree<Dim>& other) {
  KDTreeNode * root = new KDTreeNode(other->root);
  copy(root, other->root);
  size = other.size;
}

template <int Dim>
void KDTree<Dim>::copy(KDTreeNode * root, KDTreeNode * other){
  if(other == NULL) return;
  KDTreeNode * copy = new KDTreeNode(other->Point);
  copy->left = copyTree(root, other->left);
  copy->right = copyTree(root, other->right);
}

template <int Dim>
const KDTree<Dim>& KDTree<Dim>::operator=(const KDTree<Dim>& rhs) {
  if (this != &rhs) {
    destroy();
    copy(rhs);
  }
  return *this;
}

template <int Dim>
KDTree<Dim>::~KDTree() {
  destroy(root);
}

template <int Dim>
void KDTree<Dim>::destroy(KDTreeNode * root){
  if(root == NULL) return;
  destroy(root->right);
  destroy(root->left);
  delete root;
  root = NULL;
}

template <int Dim>
Point<Dim> KDTree<Dim>::findNearestNeighbor(const Point<Dim>& query) const{
  return findNearestNeighbor(query, 0, root);
}

template <int Dim>
Point<Dim> KDTree<Dim>::findNearestNeighbor(const Point<Dim>& query, int dim, KDTreeNode * curRoot) const {
  if(curRoot->left == NULL && curRoot->right == NULL) return curRoot->point;

  Point<Dim> nearest = curRoot->point;
  bool visitedLeft;
  Point<Dim> tempNearest;

  if(smallerDimVal(query, curRoot->point, dim)){
    if(curRoot->left != NULL){
      nearest = findNearestNeighbor(query, (dim + 1)%Dim, curRoot->left); 
    } else {
      nearest = curRoot->point; 
    }
    visitedLeft = true;
  } else if (!smallerDimVal(query, curRoot->point, dim) && curRoot->right != NULL){
    if(curRoot->right != NULL){
      nearest = findNearestNeighbor(query, (dim + 1)%Dim, curRoot->right); 
    } else {
      nearest = nearest = curRoot->point; 
    }
  } 

  if(shouldReplace(query, nearest, curRoot->point)) nearest = curRoot->point;

  double radius = squaredDist(query, nearest);
  double splitDist = (curRoot->point[dim] - query[dim])*(curRoot->point[dim] - query[dim]);

  if(radius == splitDist){
    if(nearest < curRoot->point) return nearest;
  }

  if(radius >= splitDist){
    if(visitedLeft && curRoot->right != NULL)  tempNearest = findNearestNeighbor(query, (dim + 1) % Dim, curRoot->right);
    else if(!visitedLeft && curRoot->left != NULL) tempNearest = findNearestNeighbor(query, (dim + 1) % Dim, curRoot->left);
    if (shouldReplace(query, nearest, tempNearest)) nearest = tempNearest;
  }

  return nearest;
}