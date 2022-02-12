/**
 * @file  			Node.h  
 * @description 	Dairesel bağlı liste'ye kaynak oluşturan düğüm klasörü
 * @course  		1A  
 * @assignment  	1.ödev   
 * @date  			10.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#ifndef _NODE_
#define _NODE_

class DoublyLinkedList;
class Node
{
private:
	Node* prev;
	int data;
	Node* next;
public:
	Node();
	Node(int);
	//~Node();

	friend class DoublyLinkedList;
};

#endif
