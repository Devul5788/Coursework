/**
 * @file heap.cpp
 * Implementation of a heap class.
 */
using namespace std;
template <class T, class Compare>
size_t heap<T, Compare>::root() const
{
    // @TODO Update to return the index you are choosing to be your root.
    return 0;
}

template <class T, class Compare>
size_t heap<T, Compare>::leftChild(size_t currentIdx) const
{
    // @TODO Update to return the index of the left child.
    if( (2*currentIdx +1) < _elems.size() ){
      return 2*currentIdx +1;
    }
    return -1;
}

template <class T, class Compare>
size_t heap<T, Compare>::rightChild(size_t currentIdx) const
{
    // @TODO Update to return the index of the right child.
     if( (2*currentIdx +2) < _elems.size() ){
      return 2*currentIdx +2;
    }
    return -1;
}

template <class T, class Compare>
size_t heap<T, Compare>::parent(size_t currentIdx) const
{
    // @TODO Update to return the index of the parent.
    return (currentIdx -1)/2;
}

template <class T, class Compare>
bool heap<T, Compare>::hasAChild(size_t currentIdx) const
{
    // @TODO Update to return whether the given node has a child
    unsigned cursize = _elems.size();
    if(2*currentIdx+1 < cursize  ||  2*currentIdx+2 < cursize){
      return true;
    }
     return false;
}

template <class T, class Compare>
size_t heap<T, Compare>::maxPriorityChild(size_t currentIdx) const
{
    // @TODO Update to return the index of the child with highest priority
    ///   as defined by higherPriority()

    if (2*currentIdx+2 >= _elems.size()) {
        return 2*currentIdx+1;
    }

    T a = _elems[2*currentIdx+1];
    T b = _elems[2*currentIdx+2];
    if(higherPriority(a,b)){
        return 2*currentIdx+1;
    }
    return 2*currentIdx+2 ;
}

template <class T, class Compare>
void heap<T, Compare>::heapifyDown(size_t currentIdx)
{
    // @TODO Implement the heapifyDown algorithm.
    if(currentIdx<0 || currentIdx>=_elems.size()){
        return;
    }

    if(hasAChild(currentIdx)){
       unsigned min = maxPriorityChild(currentIdx);
       if(higherPriority(_elems[min] , _elems[currentIdx]))  {
       std::swap(_elems[currentIdx],_elems[min] );
       heapifyDown(min);
       }
    }
    return;
}

template <class T, class Compare>
void heap<T, Compare>::heapifyUp(size_t currentIdx)
{
    if (currentIdx == root())
        return;
    size_t parentIdx = parent(currentIdx);
    if (higherPriority(_elems[currentIdx], _elems[parentIdx])) {
        std::swap(_elems[currentIdx], _elems[parentIdx]);
        heapifyUp(parentIdx);
    }
}

template <class T, class Compare>
heap<T, Compare>::heap()
{
    // @TODO Depending on your implementation, this function may or may
    ///   not need modifying

}

template <class T, class Compare>
heap<T, Compare>::heap(const std::vector<T>& elems) 
{
    // @TODO Construct a heap using the buildHeap algorithm
    //_elems.resize(elems.size());
    for(unsigned i=0; i< elems.size();i++ ){
     _elems.push_back(elems[i]);
    }


    for( int i= _elems.size()-1 ; i>=0; i--){
        heapifyDown(parent(i));
    }
}

template <class T, class Compare>
T heap<T, Compare>::pop()
{
    // @TODO Remove, and return, the element with highest priority
    unsigned lindex = _elems.size()-1;
    std::swap(_elems[lindex],_elems[0]);
    T result = _elems[lindex];
    _elems.pop_back();
    heapifyDown(0);
    //_elems.resize(lindex);
    return result;
}

template <class T, class Compare>
T heap<T, Compare>::peek() const
{
    // @TODO Return, but do not remove, the element with highest priority

    return _elems[0];
}

template <class T, class Compare>
void heap<T, Compare>::push(const T& elem)
{
    // @TODO Add elem to the heap
    _elems.push_back(elem);
    heapifyUp(_elems.size()-1);
}

template <class T, class Compare>
void heap<T, Compare>::updateElem(const size_t & idx, const T& elem)
{
    // @TODO In-place updates the value stored in the heap array at idx
    // Corrects the heap to remain as a valid heap even after update
    _elems[idx] = elem;
    heapifyDown(idx);
    heapifyUp(idx);

}


template <class T, class Compare>
bool heap<T, Compare>::empty() const
{
    // @TODO Determine if the heap is empty
    return _elems.empty();
}

template <class T, class Compare>
void heap<T, Compare>::getElems(std::vector<T> & heaped) const
{
    for (size_t i = root(); i < _elems.size(); i++) {
        heaped.push_back(_elems[i]);
    }
}