/****************************************************************************
  **					SAKARYA �N�VERS�TES�
  **			B�LG�SAYAR VE B�L���M B�L�MLER� FAK�LTES�
  **				    B�LG�SAYAR M�HEND�SL��� B�L�M�
  **				PROGRAMLAMAYA G�R��� DERS�
  **
  **				�DEV NUMARASI�...:2
  **				��RENC� ADI...............:FURKAN TEKTA�
  **				��RENC� NUMARASI.:B181210049
  **				DERS GRUBU����:A
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
  //harflere kar��l�k gelen ASCII say�lar�ndan olu�an dizi tan�mlad�k.
	int rastgele[ESAY] = { 65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,
		83,84,85,86,87,88,89,97,98,99,100,101,102,103,104,105,106,107,108,
		109,110,111,112,113,114,115,116,117,118,119,120,121 };

	cout << "Tekrarsiz ve Rastgele Dizi" << endl;//�ST A�IKLAMA.
	srand(time(NULL));
	for (int m = 0; m < 5; m++)
	{
		for (int n = 0; n < 10; n++)
		{
			rastgele_sayi = rand() % 50;//rastgele sayi olu�turuldu;
			matris[m][n] = rastgele[rastgele_sayi];//tekrars�z �ekilde yazd�ramad�m.
			cout << matris[m][n] << "     ";//ekrana yaz�lmas�.
		}
		cout << endl;//�ekil b�t�nl��� i�in alt sat�rlara ge�ildi.
		cout << endl;
	}

	cout << "Siralanmis Dizi" << endl;//ALT A�IKLAMA.
	k = 0;//diziden s�ra ile de�er almak i�in ilk de�ere 0 at�yoruz ve d�ng� ile her seferinde 1 artt�r�yoruz.
	for (i = 0; i < 5; i++)
	{
		for (j = 0; j < 10; j++)
		{
			matris[i][j] = rastgele[k];//matrise de�erler tek tek atan�yor.
			k++;//bir sonraki de�ere ge�iyoruz.
			cout << matris[i][j] << "     ";//matrisin yazd�r�lmas�...
		}
		cout << endl;//alt sat�r ge�ildi.
		cout << endl;
	}

	system("pause");
	return 0;
}