/****************************************************************************
**					SAKARYA �N�VERS�TES�
**			B�LG�SAYAR VE B�L���M B�L�MLER� FAK�LTES�
**				    B�LG�SAYAR M�HEND�SL��� B�L�M�
**				PROGRAMLAMAYA G�R��� DERS�
**
**				�DEV NUMARASI:1
**				��RENC� ADI:FURKAN TEKTA�
**				��RENC� NUMARASI.:B181210049
**				DERS GRUBU:A
****************************************************************************/

#include<iostream>
using namespace std;
int main()
{
	int i, j;
	      //�st b�l�m
	for (i = 1; i <= 11; i++) {//toplam sat�r say�s�
		for (j = 1; j <= 11; j++) {
			if (i <= 5 && j <= 6 - i || j >= 6 + i) {
				cout << "* ";
				}
			//alt b�l�m
			else if (i >= 7 && j <= i - 6|| j >= 18- i) {
				cout << "* ";
			}
			else {
				cout << "  ";
			}
		}
		cout << endl;//alt sat�ra ge�i�
	}//ana for d�ng�s� sonu

	cout << endl;
	system("pause");
	return 0;


}
  