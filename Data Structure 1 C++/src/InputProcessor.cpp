/**
 * @file  			InputProcessor.cpp  
 * @description 	Verilen txt'yi uygun formata getirdiğimiz klasör 
 * @course  		1A  
 * @assignment  	1.ödev   
 * @date  			10.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#include "InputProcessor.h"

#include<iostream>
#include<string>

using namespace std;


InputProcessor::InputProcessor(string input)
{
	this->numberSize = input.length() / 2;
	
	firstNumber = new int[input.length() / 2];
	secondNumber = new int[input.length() / 2];

	// 2 sayıyı elde etme..
	getNumbers(input); 

	// sayıları 3'lü formatta alma..
	fixNumber(firstNumber); 
	fixNumber(secondNumber);
};

InputProcessor::~InputProcessor()
{
	delete[] firstNumber;
	delete[] secondNumber;
};

int* InputProcessor::getFirstNumber()
{
	return firstNumber;
};

int* InputProcessor::getSecondNumber()
{
	return secondNumber;
};

void InputProcessor::getNumbers(string input)
{
	int i;
	int medium = (input.length() / 2) + 1; // tüm txt uzunluğunun ortası alınır ve böylelikte #'tan kurtuluruz..


	char temp;
	for  (i = 0; i < (input.length() / 2); i++) // uzunluğun yarısı kadar dönmesi yeterli..
	{
		temp = input[i];

		if(temp != '#') // #'a geldiğimizde 2 sayıyı da almış oluyoruz..
		{
			firstNumber[i] = input[i] - '0'; // char'dan int'e dönüşüm.. || #'ın öncesi
			secondNumber[i] = input[medium + i] - '0'; // char'dan int'e dönüşüm.. || #'ın sonrası
		}
	}
};

void InputProcessor::fixNumber(int*& number)
{
	int i;
	static int a = 0;
	string str = "";

	int* dividedArray = new int[numberSize / 3]; 

	for (i = 0; i < numberSize; i++)
	{
		if ((i % 3) + 1 == 3) // her üçlü'de burası tetiklenir..
		{
			str += to_string(number[i]); // son basamağı yakalamak için..
			if (str[0] == '0') str[0] = '1'; // ilk basamak 0 ise onu 1 yapıyoruz..
			dividedArray[a++] = stoi(str);
			str = "";		
		}

		else str += to_string(number[i]);
	}

	a = 0;
	
	/* herhangi 2 sayının bellekte tuttuğu alanlar silinir.
	Sayıları tutan number pointer'ına 3'lü sayıların adresleri atanır.*/
	delete[] number;
	number = dividedArray;
	dividedArray = nullptr;
};
