/**
 * @file  			DoublyLinkedList.h  
 * @description 	Listeler ile ilgili işlemleri yaptığımız klasör
 * @course  		1A  
 * @assignment  	1.ödev   
 * @date  			10.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#ifndef _DOUBLYLINKEDLIST_
#define _DOUBLYLINKEDLIST_

#include "Node.h"

class DoublyLinkedList
{
private:
	Node* first;
	Node* second;
	int size;
public:
	DoublyLinkedList(int[], int[], int);
	~DoublyLinkedList();

	void compareList();
	Node* searchNode(Node*, int);
	void reverseList(Node*);
	void changeNodes(Node*, Node*);
	void display();
};

#endif