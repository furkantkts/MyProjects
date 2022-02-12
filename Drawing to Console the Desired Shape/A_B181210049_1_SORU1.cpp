/****************************************************************************
**					SAKARYA ÜNÝVERSÝTESÝ
**			BÝLGÝSAYAR VE BÝLÝÞÝM BÝLÝMLERÝ FAKÜLTESÝ
**				    BÝLGÝSAYAR MÜHENDÝSLÝÐÝ BÖLÜMÜ
**				PROGRAMLAMAYA GÝRÝÞÝ DERSÝ
**
**				ÖDEV NUMARASI:1
**				ÖÐRENCÝ ADI:FURKAN TEKTAÞ
**				ÖÐRENCÝ NUMARASI.:B181210049
**				DERS GRUBU:A
****************************************************************************/

#include<iostream>
using namespace std;
int main()
{
	int i, j;
	      //üst bölüm
	for (i = 1; i <= 11; i++) {//toplam satýr sayýsý
		for (j = 1; j <= 11; j++) {
			if (i <= 5 && j <= 6 - i || j >= 6 + i) {
				cout << "* ";
				}
			//alt bölüm
			else if (i >= 7 && j <= i - 6|| j >= 18- i) {
				cout << "* ";
			}
			else {
				cout << "  ";
			}
		}
		cout << endl;//alt satýra geçiþ
	}//ana for döngüsü sonu

	cout << endl;
	system("pause");
	return 0;


}
  