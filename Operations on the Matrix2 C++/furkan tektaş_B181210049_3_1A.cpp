/****************************************************************************
**					SAKARYA �N�VERS�TES�
**			         B�LG�SAYAR VE B�L���M B�L�MLER� FAK�LTES�
**				    B�LG�SAYAR M�HEND�SL��� B�L�M�
**				          PROGRAMLAMAYA G�R��� DERS�
**
**				�DEV NUMARASI=3
**				��RENC� ADI=FURKAN TEKTA�
**				��RENC� NUMARASI=B181210049
**				DERS GRUBU=1A
****************************************************************************/

#include <iostream>


using namespace std;

const int cekirdek_b = 5;


struct Islem
{
	int cekirdek_boyutu, kayma_miktari;
	int cekirdek[cekirdek_b][cekirdek_b];
	int sonuc[99][99];
	int giris[5][5] = { 3,2,5,1,4,
									6,2,1,0,7,
									3,0,0,2,0,
									1,1,3,2,2,
									0,3,1,0,0 };
} islem;

// giris matrisinin boyutu hesaplan�yor. KARE MATR�S OLDU�U ���N SATIR VE S�TUN DE�ERLER� AYNI OLMAKTA.
int girisBoyutu = sizeof(islem.giris) / sizeof(islem.giris[0]);

void kontrol(int, int);

int main()
{
	

	// �ekirdek boyutu ve kayma miktar� istenir.
	cout << "Cekirdek boyutunu giriniz..: "; cin >> islem.cekirdek_boyutu;
	cout << "Kayma miktar�n� giriniz..: "; cin >> islem.kayma_miktari;

	// Kayma miktar� kontrol ediliyor.
	kontrol(islem.kayma_miktari, islem.cekirdek_boyutu);

	// cekirdek matrisi de�erleri kullan�c�dan al�n�yor.
	const int sutun_2 = islem.cekirdek_boyutu, satir_2 = islem.cekirdek_boyutu;
	for (int m = 0; m < satir_2; m++)
	{
		for (int n = 0; n < sutun_2; n++)
		{
			cout << "cekirdek[" << m << "][" << n << "] = ";
			cin >> islem.cekirdek[m][n];
		}
	}


	// sonuc matrisinin sat�r ve sutun de�erleri hesaplan�yor.
	int satir_3 = ((girisBoyutu - satir_2) / islem.kayma_miktari) + 1;
	int sutun_3 = ((girisBoyutu - sutun_2) / islem.kayma_miktari) + 1;

	// sonuc matrisi olu�turuluyor.
	int k_satir = 0, k_sutun = 0, alt_satir = 1;
	for (int x = 0; x < satir_3; x++)
	{
		for (int y = 0; y < sutun_3; y++)
		{
			int toplam = 0;
			int k = 0, m = 0;
			for (int i = k_satir; i < girisBoyutu; i++)
			{
				for (int j = k_sutun; j < girisBoyutu; j++)
				{
					toplam += (islem.giris[i][j] * islem.cekirdek[k][m]);
					m++;
					if (m == sutun_2)
						break;
				}
				k++;
				m = 0;
				if (k == satir_2)
					break;
			}
			k_sutun += islem.kayma_miktari;
			if ((girisBoyutu - k_sutun) < islem.cekirdek_boyutu) {
				k_sutun = 0;
				k_satir = alt_satir;
				alt_satir++;
			}

			islem.sonuc[x][y] = toplam;
		}
	}

	// sonuc matrisinin ��kt�s� ekrana veriliyor.
	for (int a = 0; a < satir_3; a++)
	{
		for (int b = 0; b < sutun_3; b++)
		{
			cout << islem.sonuc[a][b] << "\t";
		}
		cout << endl;
	}

	system("pause");
	return 0;
}

// Kayma miktar�n�n kontrol� bu fonksiyonda yap�l�yor.
void kontrol(int A, int B)
{
	while (A > (girisBoyutu - B) || girisBoyutu % A != 0)
	{
		cout << "Bu islem yapilamaz..\n";
		cout << "Cekirdek boyutunu giriniz..: "; cin >> B;
		cout << "Kayma miktar�n� giriniz..: "; cin >> A;
	}
}