/**
 * @file  			Test.cpp  
 * @description 	main klasörü
 * @course  		1A  
 * @assignment  	2.ödev   
 * @date  			22.08.2021  
 * @author  		Furkan TEKTAS   
 */
 
#include "Node.h"
#include "Person.h"
#include "AVL.h"
 
#include<iostream>
#include<string>
#include<fstream>

using namespace std;


int main()
{
	ifstream ifs;
	ifs.open("Kisiler.txt");

	string input = "";


	AVL avl;
	Node* root = nullptr;


	string line;
	while (getline(ifs, line))
	{
		int i, count{};
		string temp_field = "";
		char temp;

		Person p;

		// Satır sonunda '#' karakteri olmadığından döngü uzunluğun bir fazlası kadar dönüyor..
		for (i = 0; i < line.length() + 1; i++)
		{
			temp = line[i];

			// Son elemanı elde etmek adına '\0' arıyoruz..
			if (temp == '#' || temp == '\0')
			{
				p.setFields(temp_field, ++count);
				temp_field = "";
			}

			else
				temp_field += temp;
		}


		root = avl.insert(root, p); // Ağaca yeni düğüm ekleme..
		avl.updateHeights(root); // Düğüm yükseklik güncelleme..
		avl.updateDepths(root, 0); // Düğüm derinlik güncelleme..
	}

	avl.printLevelOrder(root);


	return 0;
}