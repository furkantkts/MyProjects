/**
 * @file  			Node.cpp  
 * @description 	Düğüm ile ilgili işlemleri yaptığımız klasör
 * @course  		1A  
 * @assignment  	2.ödev   
 * @date  			22.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#include "Node.h"

#include<iostream>
#include<string>

using namespace std;

// Stack'teki eleman sayısını bulan fonksiyon..
int GetLength(Stack stk)
{
	int i = 0;

	while (stk.top-- > 0)
	{
		i++;
	}

	i++;
	stk.top = i;
	return i;
}


Node::Node()
{
	//kisi = new Kisi;
	left = nullptr;
	right = nullptr;
	height = 0;
}

Node::Node(Person p_person)
{
	person = p_person;
	left = nullptr;
	right = nullptr;
	height = 0;
}

// Node'un depolanmış Yükseklik değerleri Stack'ten tek tek getiriliyor..
string Node::getHeights()
{
	int i;
	int h_size = GetLength(heights);
	string m_heights = "";

	for (i = 0; i < h_size; i++)
	{
		if (i == h_size - 1) m_heights += to_string(heights.pop());
		else m_heights += to_string(heights.pop()) + ",";
	}

	return m_heights;
}

// Node'un depolanmış Derinlik değerleri Stack'ten tek tek getiriliyor..
string Node::getDepths()
{
	int i;
	int d_size = GetLength(depths);
	string m_depths = "";

	for (i = 0; i < d_size; i++)
	{
		if (i == d_size - 1) m_depths += to_string(depths.pop());
		else m_depths += to_string(depths.pop()) + ",";
	}

	return m_depths;
}