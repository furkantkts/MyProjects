/**
 * @file  			Stack.cpp  
 * @description 	Yığıt ile ilgili işlemleri yaptığımız klasör
 * @course  		1A  
 * @assignment  	2.ödev   
 * @date  			22.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#include "Stack.h"
#include<iostream>

using namespace std;



Stack::Stack()
{
	top = -1;
	S = new int[size];
}

// Çöp oluşmaması adına stack dizi boyutu her eklenmede değişiyor..
void Stack::push(int x)
{
	int i;

	size++;

	if (top == size - 1)
		cout << "Stack Owerflow" << endl;

	else
	{
		int* new_S = new int[size];

		for (i = 0; i < size - 1; i++)
			new_S[i] = S[i];

		delete[] S;
		S = new_S;
		new_S = nullptr;

		top++;
		S[top] = x;
	}
}

int Stack::pop()
{
	int x = -1;

	if (top == -1)
		cout << "Stack Underflow" << endl;

	else
		x = S[top--];

	return x;
}