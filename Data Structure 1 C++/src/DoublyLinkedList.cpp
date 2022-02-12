/**
 * @file  			DoublyLinkedList.cpp 
 * @description 	Listeler ile ilgili işlemleri yaptığımız klasör
 * @course  		1A  
 * @assignment  	1.ödev   
 * @date  			10.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#include "DoublyLinkedList.h"

#include<iostream>
 
using namespace std;


DoublyLinkedList::DoublyLinkedList(int number_first[], int number_second[], int size): size{size}
{
	int i, j;
	Node* temp = nullptr;

	for (i = 0; i < 2; i++)
	{
		if (i == 0) // ilk dairesel bağlı liste oluşturulması..
		{
			first = new Node(number_first[0]);
			temp = first;

			for (j = 1; j < size; j++)
			{
				Node* f_new_node = new Node();
				f_new_node->data = number_first[j];
				f_new_node->prev = temp;
				f_new_node->next = temp->next;
				temp->next = f_new_node;
				temp = f_new_node;
			}
		}
		else // ikinci dairesel bağlı liste oluşturulması..
		{
			second = new Node(number_second[0]);
			temp = second;

			for (j = 1; j < size; j++)
			{
				Node* l_new_node = new Node();
				l_new_node->data = number_second[j];
				l_new_node->prev = temp;
				l_new_node->next = temp->next;
				temp->next = l_new_node;
				temp = l_new_node;
			}
		}
	}
}

DoublyLinkedList::~DoublyLinkedList()
{
	Node* first_current = first;
	Node* second_current = second;

	while (first && second)
	{
		first = first->next;
		second = second->next;
		delete[] first_current;
		delete[] second_current;
		first_current = first;
		second_current = second;
	}
}

void DoublyLinkedList::compareList()
{
	int i;
	Node* first_temp;
	Node* second_temp;

	for (i = 0; i < size; i++)
	{
		first_temp = searchNode(first, i);
		second_temp = searchNode(second, i);

		if (first_temp->data > second_temp->data)
			reverseList(first);

		else if (first_temp->data == second_temp->data)
			reverseList(second);

		else if (first_temp->data < second_temp->data)
			changeNodes(first_temp, second_temp);
	}
}

void DoublyLinkedList::reverseList(Node* list)
{
	Node* current = list;
	Node* temp = nullptr;

	while (current)
	{
		temp = current->prev;
		current->prev = current->next;
		current->next = temp;
		current = current->prev;
	}

	if (temp)
		first = temp->prev;
}

Node* DoublyLinkedList::searchNode(Node* list, int index) // Aynı konumdaki düğümleri döndürdüğümüz method..
{
	Node* current = list;

	int count = 0;
	while (current != nullptr)
	{
		if (count == index)
			return current;

		count++;
		current = current->next;
	}
}

void DoublyLinkedList::changeNodes(Node* node_1, Node* node_2)
{
	Node* prev_node_1 = node_1->prev;
	Node* next_node_1 = node_1->next;
	Node* prev_node_2 = node_2->prev;
	Node* next_node_2 = node_2->next;

	if (node_1->prev == nullptr || node_2->prev == nullptr) // başta 
	{
		node_1->next = next_node_2;
		next_node_2->prev = node_1;
		node_2->next = next_node_1;
		next_node_1->prev = node_2;

		first = node_2;
		second = node_1;
	}

	else if (node_1->next == nullptr || node_2->next == nullptr) // sonda
	{
		node_1->prev->next = node_2;
		node_1->prev = prev_node_2;
		node_2->prev->next = node_1;
		node_2->prev = prev_node_1;
	}

	else // ortada veya herhangi bir yer
	{
		node_1->prev->next = node_2;
		node_2->prev->next = node_1;
		node_1->next->prev = node_2;
		node_2->next->prev = node_1;

		node_1->prev = prev_node_2;
		node_1->next = next_node_2;
		node_2->prev = prev_node_1;
		node_2->next = next_node_1;
	}
}

void DoublyLinkedList::display()
{
	Node* f_current = first;
	Node* s_current = second;

	cout << "Sayi 1:";

	for (int i = 0; i < size; i++)
	{
		cout << f_current->data;
		f_current = f_current->next;
	}

	cout << endl;

	cout << "Sayi 2:";

	for (int i = 0; i < size; i++)
	{
		cout << s_current->data;
		s_current = s_current->next;
	}
}