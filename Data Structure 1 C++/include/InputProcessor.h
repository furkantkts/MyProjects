/**
 * @file  			InputProcessor.h  
 * @description 	Verilen txt'yi uygun formata getirdiğimiz klasör 
 * @course  		1A  
 * @assignment  	1.ödev   
 * @date  			10.08.2021  
 * @author  		Furkan TEKTAS   
 */

#ifndef _INPUTPROCESSOR_
#define _INPUTPROCESSOR_

#include<string>

using namespace std;

class InputProcessor
{
private:
	int* firstNumber;
	int* secondNumber;
	int numberSize;

public:
	InputProcessor(string);
	~InputProcessor();
	
	int* getFirstNumber();
	int* getSecondNumber();

	void getNumbers(string);
	void fixNumber(int*&);
};

#endif