/****************************************************************************
  **					SAKARYA ÜNÝVERSÝTESÝ
  **			BÝLGÝSAYAR VE BÝLÝÞÝM BÝLÝMLERÝ FAKÜLTESÝ
  **				    BÝLGÝSAYAR MÜHENDÝSLÝÐÝ BÖLÜMÜ
  **				PROGRAMLAMAYA GÝRÝÞÝ DERSÝ
  **
  **				ÖDEV NUMARASI…...:2
  **				ÖÐRENCÝ ADI...............:FURKAN TEKTAÞ
  **				ÖÐRENCÝ NUMARASI.:B181210049
  **				DERS GRUBU…………:A
  ****************************************************************************/
#include<iostream>
#include<cstdlib>
#include<time.h>
#include<random>
#include<ctime>
using namespace std;
int main()
{
	int rastgele_sayi;
	int i, j, k;
	const int ESAY = 50;//ASCII tablosunun boyutu.
	char matris[5][10];//matris boyutu.
  //harflere karþýlýk gelen ASCII sayýlarýndan oluþan dizi tanýmladýk.
	int rastgele[ESAY] = { 65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,
		83,84,85,86,87,88,89,97,98,99,100,101,102,103,104,105,106,107,108,
		109,110,111,112,113,114,115,116,117,118,119,120,121 };

	cout << "Tekrarsiz ve Rastgele Dizi" << endl;//ÜST AÇIKLAMA.
	srand(time(NULL));
	for (int m = 0; m < 5; m++)
	{
		for (int n = 0; n < 10; n++)
		{
			rastgele_sayi = rand() % 50;//rastgele sayi oluþturuldu;
			matris[m][n] = rastgele[rastgele_sayi];//tekrarsýz þekilde yazdýramadým.
			cout << matris[m][n] << "     ";//ekrana yazýlmasý.
		}
		cout << endl;//þekil bütünlüðü için alt satýrlara geçildi.
		cout << endl;
	}

	cout << "Siralanmis Dizi" << endl;//ALT AÇIKLAMA.
	k = 0;//diziden sýra ile deðer almak için ilk deðere 0 atýyoruz ve döngü ile her seferinde 1 arttýrýyoruz.
	for (i = 0; i < 5; i++)
	{
		for (j = 0; j < 10; j++)
		{
			matris[i][j] = rastgele[k];//matrise deðerler tek tek atanýyor.
			k++;//bir sonraki deðere geçiyoruz.
			cout << matris[i][j] << "     ";//matrisin yazdýrýlmasý...
		}
		cout << endl;//alt satýr geçildi.
		cout << endl;
	}

	system("pause");
	return 0;
}