/**
 * @file  			Node.h  
 * @description 	Düğüm ile ilgili işlemleri yaptığımız klasör
 * @course  		1A  
 * @assignment  	2.ödev   
 * @date  			22.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#ifndef _NODE_
#define _NODE_


#include "Person.h"
#include "Stack.h"

#include<string>

using namespace std;

class Node
{
public:
	Person person;
	Node* left;
	Node* right;
	int height;
	int depth;

	Stack heights;
	Stack depths;

	Node();
	Node(Person);

	string getHeights();
	string getDepths();
};


#endif