/**
 * @file  			Person.cpp  
 * @description 	Kişiler ile ilgili işlemleri yaptığımız klasör
 * @course  		1A  
 * @assignment  	2.ödev   
 * @date  			22.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#include "Person.h"
#include<iostream>

using namespace std;

// Kişiler'in txt'den elde edilen değerleri ilgili alanlara atanıyor..
void Person::setFields(string field, int order)
{
	switch (order)
	{
	case 1:
		name = field;
		break;
	case 2:
		age = stoi(field);
		break;
	case 3:
		height = stoi(field);
		break;
	default:
		break;
	}
}