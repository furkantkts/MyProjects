/****************************************************************************
**					SAKARYA ÜNÝVERSÝTESÝ
**			BÝLGÝSAYAR VE BÝLÝÞÝM BÝLÝMLERÝ FAKÜLTESÝ
**				    BÝLGÝSAYAR MÜHENDÝSLÝÐÝ BÖLÜMÜ
**				PROGRAMLAMAYA GÝRÝÞÝ DERSÝ
**
**				ÖDEV NUMARASI:1
**				ÖÐRENCÝ ADI:FURKAN
**				ÖÐRENCÝ NUMARASI.:B181210049
**				DERS GRUBU:A
****************************************************************************/

#include<iostream>
#include<iomanip>
#include<string>
using namespace std;
int main()
{
 const int MAX = 80;
 char cumle[MAX];
 char harf[MAX];

  cout << "BÝR METÝN GÝRÝNÝZ " << endl;
  cin.get(cumle, MAX);
  cout << cumle << endl;

  int a_sayisi = 0;
  int e_sayisi = 0;
  int i_sayisi = 0;
  int o_sayisi = 0;
  int u_sayisi = 0;
  int uzunluk = strlen(cumle);
     
  for (int i = 0; i <= uzunluk; i++)
  {
	  char harf = cumle[i];
	  if (harf == 'a' ){
		  a_sayisi++;
	  }
	  else if(harf=='e')
	  {
		  e_sayisi++;
	  }
	  else if (harf == 'i')
	  {
		  i_sayisi++;
	  }
	  else if (harf == 'o')
	  {
		  o_sayisi++;
	  }
	  else if (harf == 'u')
	  {
		  u_sayisi++;
	  }
  
  }
      cout << setw(5) << "H" << setw(10) << "TS" << endl;
	  cout << setw(5) << "a" << setw(10) << a_sayisi << endl;
	  cout << setw(5) << "e" << setw(10) << e_sayisi << endl;
	  cout << setw(5) << "i" << setw(10) << i_sayisi << endl;
	  cout << setw(5) << "o" << setw(10) << o_sayisi << endl;
	  cout << setw(5) << "u" << setw(10) << u_sayisi << endl;


   	
	
	
	
	
	
	
	
	
	
	
	
	
	system("pause");
	return 0;








}