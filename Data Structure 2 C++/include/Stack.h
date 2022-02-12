/**
 * @file  			Stack.h  
 * @description 	Yığıt ile ilgili işlemleri yaptığımız klasör
 * @course  		1A  
 * @assignment  	2.ödev   
 * @date  			22.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#ifndef _STACK_
#define _STACK_


class Stack
{
public:
	int size = 0;
	int top;
	int* S;


	Stack();
	void push(int);
	int pop();
};



#endif