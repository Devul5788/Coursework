/**
 * @file list.cpp
 * Doubly Linked List (MP 3).
 */

#include "List.h"

template <class T>
List<T>::List() { 
    head_ = NULL;
    tail_ = NULL;
    length_ = 0;
}

/**
 * Returns a ListIterator with a position at the beginning of
 * the List.
 */
template <typename T>
typename List<T>::ListIterator List<T>::begin() const {
  // @TODO: graded in MP3.1
  return List<T>::ListIterator(head_);
}

/**
 * Returns a ListIterator one past the end of the List.
 */
template <typename T>
typename List<T>::ListIterator List<T>::end() const {
  // @TODO: graded in MP3.1
  return List<T>::ListIterator(NULL);
}


/**
 * Destroys all dynamically allocated memory associated with the current
 * List class.
 */
template <typename T>
void List<T>::_destroy() {
  /// @todo Graded in MP3.1
  if(length_ == 0) return;
  while(head_ != NULL){
    ListNode * temp = head_->next;
    delete head_;
    head_ = temp;
  }
  tail_ = NULL;
  head_ = NULL;
}

/**
 * Inserts a new node at the front of the List.
 * This function **SHOULD** create a new ListNode.
 *
 * @param ndata The data to be inserted.
 */
template <typename T>
void List<T>::insertFront(T const & ndata) {
  /// @todo Graded in MP3.1
  ListNode * newNode = new ListNode(ndata);
  if(length_ == 0){
    head_ = newNode;
    tail_ = newNode;
    head_->next = NULL;
    head_->prev = NULL;
  } else {
    newNode -> next = head_;
    newNode -> prev = NULL;
    head_ -> prev = newNode;
    head_ = newNode;
  } 
  length_++; 
}

/**
 * Inserts a new node at the back of the List.
 * This function **SHOULD** create a new ListNode.
 *
 * @param ndata The data to be inserted.
 */
template <typename T>
void List<T>::insertBack(const T & ndata) {
  /// @todo Graded in MP3.1
  ListNode * newNode = new ListNode(ndata);
  if(length_ == 0){
    head_ = newNode;
    tail_ = newNode;
    head_->next = NULL;
    head_->prev = NULL;
  } else {
    newNode -> next = NULL;
    newNode -> prev = tail_;
    tail_ -> next = newNode;
    tail_ = newNode;
  } 
  length_++; 
}

/**
 * Helper function to split a sequence of linked memory at the node
 * splitPoint steps **after** start. In other words, it should disconnect
 * the sequence of linked memory after the given number of nodes, and
 * return a pointer to the starting node of the new sequence of linked
 * memory.
 *
 * This function **SHOULD NOT** create **ANY** new List or ListNode objects!
 *
 * This function is also called by the public split() function located in
 * List-given.hpp
 *
 * @param start The node to start from.
 * @param splitPoint The number of steps to walk before splitting.
 * @return The starting node of the sequence that was split off.
 */
template <typename T>
typename List<T>::ListNode * List<T>::split(ListNode * start, int splitPoint) {
  /// @todo Graded in MP3.1
  ListNode * curr = start;

  for (int i = 0; i < splitPoint && curr != NULL; i++) {
    curr = curr->next;
  }

  tail_ = curr->prev; 

  if (curr != NULL) {
    curr->prev->next = NULL;
    curr->prev = NULL;
    return curr;
  }

  return NULL;
}

/**
  * Modifies List using the rules for a TripleRotate.
  *
  * This function will to a wrapped rotation to the left on every three 
  * elements in the list starting for the first three elements. If the 
  * end of the list has a set of 1 or 2 elements, no rotation all be done 
  * on the last 1 or 2 elements.
  * 
  * You may NOT allocate ANY new ListNodes!
  */
template <typename T>
void List<T>::tripleRotate() {
  // @todo Graded in MP3.1
  if(length_ < 3) return;

  ListNode * curr = head_;
  for(int i = 0; i < length_/3; i++){
    swap(curr, curr->next);
    swap(curr, curr->next);
    curr = curr->next;
  }
}

template <typename T>
void List<T>::swap(ListNode * n1, ListNode * n2) {
  if(n1 == n2) return;
  if(n1 && n2){
    if(head_ == n1) head_ = n2;
    if(tail_ == n2) tail_ = n1;

    if(n2 == n1->next){
      ListNode * node0 = n1->prev;
      ListNode * node1 = n2->next;

      if(node0 != NULL) node0->next = n2;
      n2->prev = node0;
      n2->next = n1;
      n1->prev = n2;
      n1->next = node1;
      if(node1 != NULL) node1->prev = n1;
      return;
    }
  
    ListNode * node0 = n1->prev;
    ListNode * node1 = n1->next;
    ListNode * node2 = n2->prev;
    ListNode * node3 = n2->next;

    n2->prev = node0;
    n2->next = node1;
    if(node1 != NULL) node1->prev = n2;
    if(node0 != NULL) node0->next = n2;
    n1->prev = node2;
    n1->next = node3;
    if(node2 != NULL) node2->next = n1;
    if(node3 != NULL) node3->prev = n1;
  }
}


/**
 * Reverses the current List.
 */
template <typename T>
void List<T>::reverse() {
  reverse(head_, tail_);
}

/**
 * Helper function to reverse a sequence of linked memory inside a List,
 * starting at startPoint and ending at endPoint. You are responsible for
 * updating startPoint and endPoint to point to the new starting and ending
 * points of the rearranged sequence of linked memory in question.
 *
 * @param startPoint A pointer reference to the first node in the sequence
 *  to be reversed.
 * @param endPoint A pointer reference to the last node in the sequence to
 *  be reversed.
 */
template <typename T>
void List<T>::reverse(ListNode *& startPoint, ListNode *& endPoint) {
  ListNode * start = startPoint;
  ListNode * end = endPoint;
  ListNode * start2 = startPoint;
  ListNode * end2 = endPoint;

  int len = 1;
  while(start != end){
    start = start->next;
    len++;
  }
  start = startPoint;
  for(int i = 0; i < len/2; i++){
    swap(start, end);
    ListNode * temp = start;
    if(start != NULL) start = end->next;
    if(temp != NULL) end = temp->prev;
  }
}

template <typename T>
void List<T>::reverseNth(int n) {
  /// @todo Graded in MP3.2
  if(length_ < n) return;

  ListNode * startPoint = head_;
  for(int i = 0; i <= length_/n; i++){
    ListNode * endPoint = startPoint;
    for(int j = 0; j < n - 1 && endPoint->next != NULL; j++) endPoint = endPoint->next;
    reverse(startPoint, endPoint);
    if (startPoint->next != NULL) startPoint = startPoint->next;
  }
}

/**
 * Merges the given sorted list into the current sorted list.
 *
 * @param otherList List to be merged into the current list.
 */
template <typename T>
void List<T>::mergeWith(List<T> & otherList) {
  head_ = merge(head_, otherList.head_);
  tail_ = NULL;
  length_ = length_ + otherList.length_;

  // empty out the parameter list
  otherList.head_ = NULL;
  otherList.tail_ = NULL;
  otherList.length_ = 0;
}

/**
 * Helper function to merge two **sorted** and **independent** sequences of
 * linked memory. The result should be a single sequence that is itself
 * sorted.
 *
 * This function **SHOULD NOT** create **ANY** new List objects.
 *
 * @param first The starting node of the first sequence.
 * @param second The starting node of the second sequence.
 * @return The starting node of the resulting, sorted sequence.
 */
template <typename T>
typename List<T>::ListNode * List<T>::merge(ListNode * first, ListNode* second) {
  /// @todo Graded in MP3.2
  ListNode * newHead;
  if(first->data < second->data){ newHead = first; first = first->next;}
	else{newHead = second; second = second->next;}
  ListNode * curr = newHead;

	while (first && second) {
		if (second->data < first->data) {
			curr->next = second;
			second->prev = curr;
			second = second->next;
		}
		else {
			curr->next = first;
			first->prev = curr;
			first = first->next;
		}

    //move the curr pointer to the next in line based on whatever we set above
		curr = curr->next;
	}

  //append the rest of the remaining list
	if (!first && second) {
		curr->next = second;
		second->prev = curr;
	} else if (first && !second) {
		curr->next = first;
		first->prev = curr;
	}
	return newHead;
}

/**
 * Sorts a chain of linked memory given a start node and a size.
 * This is the recursive helper for the Mergesort algorithm (i.e., this is
 * the divide-and-conquer step).
 *
 * Called by the public sort function in List-given.hpp
 *
 * @param start Starting point of the chain.
 * @param chainLength Size of the chain to be sorted.
 * @return A pointer to the beginning of the now sorted chain.
 */
template <typename T>
typename List<T>::ListNode* List<T>::mergesort(ListNode * start, int chainLength) {
  /// @todo Graded in MP3.2
  if (chainLength == 1) {
    start->prev = NULL;
    start->next = NULL;
    return start;
  }

  ListNode* tmp = start;
  int mid = chainLength / 2;
  for (int i = 0; i < mid; i++) tmp = tmp -> next;

  //initialize the head and the tail of both lists as separate lists
  if (tmp != NULL){ tmp -> prev-> next = NULL; tmp -> prev = NULL; }

  start = mergesort(start, mid);
  tmp = mergesort(tmp, chainLength - mid);
  start = merge(start, tmp);
  
  return start;
}