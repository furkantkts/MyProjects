/**
 * @file  			main.cpp  
 * @description 	main klasörü
 * @course  		1A  
 * @assignment  	1.ödev   
 * @date  			10.08.2021  
 * @author  		Furkan TEKTAS   
 */

#include "InputProcessor.h"
#include "DoublyLinkedList.h"

#include<iostream>
#include<fstream>
#include<string>


using namespace std;

int main()
{
	ifstream ifs;
	ifs.open("Sayilar.txt");

	string input = "";

	string line;
	if (ifs.is_open())
	{
		while (getline(ifs, line))
		{
			input += line;
		}
	}


	
	InputProcessor ip(input);
	DoublyLinkedList dll(ip.getFirstNumber(),ip.getSecondNumber(),(input.length() / 6));

	dll.compareList();	
	dll.display();

	ifs.close();


	return 0;
}