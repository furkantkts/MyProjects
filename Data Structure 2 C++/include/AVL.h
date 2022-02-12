/**
 * @file  			AVL.h  
 * @description 	AVL ağacı ile ilgili işlemleri yaptığımız klasör
 * @course  		1A  
 * @assignment  	2.ödev   
 * @date  			22.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#ifndef _AVL_
#define _AVL_

#include "Node.h"


class AVL
{
public:
	AVL();

	int getMax(int,int);
	int getHeight(Node*);
	int getBalanceFactor(Node*);
	Node* insert(Node*,Person);
	Node* rightRotate(Node*);
	Node* leftRotate(Node*);

	int updateHeights(Node*);
	void updateDepths(Node*,int);

	void printLevelOrder(Node*);
	void printCurrentLevel(Node*,int);
};


#endif