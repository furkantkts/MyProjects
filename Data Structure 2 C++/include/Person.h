/**
 * @file  			Person.h  
 * @description 	Kişiler ile ilgili işlemleri yaptığımız klasör
 * @course  		1A  
 * @assignment  	2.ödev   
 * @date  			22.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#ifndef _PERSON_
#define _PERSON_

#include<string>

using namespace std;

class Person
{	
public:
	string name;
	int age;
	int height;

	//Person();
	void setFields(string, int);
};


#endif