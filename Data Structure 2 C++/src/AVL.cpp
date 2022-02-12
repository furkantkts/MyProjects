/**
 * @file  			AVL.cpp  
 * @description 	AVL ağacı ile ilgili işlemleri yaptığımız klasör
 * @course  		1A  
 * @assignment  	2.ödev   
 * @date  			22.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#include "AVL.h"
#include<iostream>

using namespace std;

 
AVL::AVL()
{
}

int AVL::getMax(int a, int b)
{
	return (a > b) ? a : b;
}

int AVL::getHeight(Node* node)
{
	int hl, hr;
	if (!node)  return 0;
	hl = getHeight(node->left);
	hr = getHeight(node->right);
	return hl > hr ? hl + 1 : hr + 1;
}

// Düğüm denge(Sol yükseklik-Sağ yükseklik) hesaplama..
int AVL::getBalanceFactor(Node* node)
{
	int hl, hr;
	if (!node)  return 0;
	hl = getHeight(node->left);
	hr = getHeight(node->right);
	return hl - hr;
}

// Sağa kaydırma..
Node* AVL::rightRotate(Node* p)
{
	Node* pl = p->left;
	Node* plr = pl->right;

	pl->right = p;
	p->left = plr;

	p->height = getMax(getHeight(p->left), getHeight(p->right)) + 1;
	pl->height = getMax(getHeight(pl->left), getHeight(pl->right)) + 1;

	return pl;
}

// Sola kaydırma..
Node* AVL::leftRotate(Node* p)
{
	Node* pr = p->right;
	Node* prl = pr->left;

	pr->left = p;
	p->right = prl;

	p->height = getMax(getHeight(p->left), getHeight(p->right)) + 1;
	pr->height = getMax(getHeight(pr->left), getHeight(pr->right)) + 1;

	return pr;
}

// Yükseklik ve Derinlikten bağımsız uygun ağaç düzenine göre ekleme yapılıyor..
// Yükseklik ve Derinlik sonradan güncelleniyor(Bu fonksiyon dışında)..
Node* AVL::insert(Node* node, Person person)
{
	if (node == NULL)
		return(new Node(person));

	if (person.height < node->person.height)
		node->left = insert(node->left, person);
	else if (person.height > node->person.height)
		node->right = insert(node->right, person);
	else
		return node;

	node->height = 1 + getMax(getHeight(node->left), getHeight(node->right));


	int balance = getBalanceFactor(node);


	// LL Case
	if (balance > 1 && person.height < node->left->person.height)
		return rightRotate(node);

	// RR Case
	if (balance < -1 && person.height > node->right->person.height)
		return leftRotate(node);

	// LR Case
	if (balance > 1 && person.height > node->left->person.height)
	{
		node->left = leftRotate(node->left);
		return rightRotate(node);
	}

	// RL Case
	if (balance < -1 && person.height < node->right->person.height)
	{
		node->right = rightRotate(node->right);
		return leftRotate(node);
	}

	return node;
}

// Her node yeni bir node eklendikten sonra yükseklik değerini güncelliyor..
int AVL::updateHeights(Node* node)
{
	int height;

	if (node == NULL)
		return -1;

	int left = updateHeights(node->left);
	int right = updateHeights(node->right);

	height = 1 + max(left, right);

	node->height = height;

	node->heights.push(height);

	return height;
}

// Her node yeni bir node eklendikten sonra derinlik değerini güncelliyor..
void AVL::updateDepths(Node* node, int depth)
{
	if (node != nullptr)
	{
		node->depth = depth;
		node->depths.push(depth);
		updateDepths(node->left, depth + 1); // left sub-tree
		updateDepths(node->right, depth + 1); // right sub-tree
	}
}

void AVL::printLevelOrder(Node* node)
{
	int h = getHeight(node);
	int i;
	for (i = 1; i <= h; i++)
		printCurrentLevel(node, i);
}

void AVL::printCurrentLevel(Node* node, int level)
{
	if (node == NULL)
		return;
	if (level == 1) // ilk node..
	{
		cout << node->person.name << " " << node->person.age << " " << node->person.height << "\n"
			<< "D(" << node->getHeights() << ")\n" << "Y(" << node->getDepths() << ")\n\n";
	}

	else if (level > 1) // sonraki node'lar..
	{
		printCurrentLevel(node->left, level - 1);
		printCurrentLevel(node->right, level - 1);
	}
}