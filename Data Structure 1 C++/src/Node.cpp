/**
 * @file  			Node.cpp
 * @description 	Dairesel bağlı liste'ye kaynak oluşturan düğüm klasörü
 * @course  		1A  
 * @assignment  	1.ödev   
 * @date  			10.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#include "Node.h"

using namespace std;
 
 
Node::Node()
{
	prev = next = nullptr;
}

Node::Node(int data):data{data}
{
	prev = next = nullptr;
}