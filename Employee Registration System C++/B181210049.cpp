/****************************************************************************
**						           SAKARYA ÜNİVERSİTESİ
**						  BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ
**                             BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ
**								  PROGRAMLAMAYA GİRİŞİ DERSİ
**
**                            
**	                          ÖDEV NUMARASI.............: 1
**                            ÖĞRENCİ ADI...............: Furkan TEKTAŞ
**                            ÖĞRENCİ NUMARASI..........: B181210049
**                            DERS GRUBU................: 1/A
****************************************************************************/

#include<iostream>
#include<fstream>
#include<vector>
#include<sstream> 
#include<string>

using namespace std;

class URUN{
public:
	string numara_urun;
	string isim_urun;
	string adet;
	float adet_fiyati;
	string marka;
	URUN(string numara_urun,string isim_urun,string adet,float adet_fiyati,string marka);
	URUN();
};
class PROJE{
public:
	string numara_proje;
	string isim_proje;
	string yoneten_firma_proje;
	string sorumlu_proje;
	string kontrol_proje;
	PROJE();
	PROJE(string,string,string,string,string);
};
class HAKEDIS{
public:
	string numara_proje;
	string periyot;
	vector<URUN> ikinci_eller;
	vector<int> total_tutarlar;
	HAKEDIS();
	HAKEDIS(string numara_urun,string eon);
	void sil_urun(string numara_urun);
	void ekle_urun(URUN& ekle_urun,int tutar);
	void listele_urun();
	URUN& ara_urun(string numara_urun,int& pos_numara);
};
vector<HAKEDIS> hakedisler;
vector<URUN> urunler;
vector<PROJE> projeler;
void ekle_urun(URUN& urun){
	urunler.push_back(urun);
}
void sil_urun(string numara_urun){
	vector<URUN>::iterator tasi;
	tasi = urunler.begin();
	while(tasi != urunler.end()){
		if(tasi->numara_urun == numara_urun)
			urunler.erase(tasi);
		else
			tasi++;
	}
}
URUN& ara_urun(string numara_urun){
	for(int i=0;i<urunler.size();i++)
		if(urunler[i].numara_urun == numara_urun){
			return urunler[i];
		}
	URUN* bos_olan_urun = new URUN();
	return *bos_olan_urun;
}
void yazdir_urun(URUN urun){
	cout<<urun.numara_urun<<" "<<urun.isim_urun<<" "<<urun.adet<<" "<<urun.adet_fiyati<<" "<<urun.marka<<endl;
}
void raporla_urun(){
	for(int i=0;i<urunler.size();i++)
		yazdir_urun(urunler[i]);
}
URUN::URUN(string numara_urun,string isim_urun,string adet,float adet_fiyati,string marka){
	this->numara_urun = numara_urun;
	this->isim_urun = isim_urun;
	this->adet = adet;
	this->adet_fiyati = adet_fiyati;
	this->marka = marka;
}
URUN::URUN(){
	numara_urun = '0';
	isim_urun = "Urun Yok";
	adet = "adet Yok";
	adet_fiyati = 0;
	marka = "Marka Yok";
}
void ekle_proje(PROJE& proje){
	projeler.push_back(proje);
}
void sil_proje(string numara_proje){
	vector<PROJE>::iterator tasi;
	tasi = projeler.begin();
	while(tasi != projeler.end()){
		if(tasi->numara_proje == numara_proje){
			projeler.erase(tasi); 
			cout<<"Basarili silme\n";
			return;
		}
		else tasi++;
	}
	cout<<"Basarisiz silme\n";
}
PROJE& ara_proje(string numara_proje){
	for(int i=0;i<projeler.size();i++)
		if(projeler[i].numara_proje == numara_proje){
			return projeler[i];
		}
	PROJE* bos_olan_proje = new PROJE();
	return *bos_olan_proje;
}
void yazdir_proje(PROJE proje){
	cout<<proje.numara_proje<<" "<<proje.isim_proje<<" "<<proje.yoneten_firma_proje<<" "<<proje.sorumlu_proje<<" "<<proje.kontrol_proje<<endl;
}
void raporla_proje(){
	for(int i=0;i<projeler.size();i++)
		yazdir_proje(projeler[i]);
}
PROJE::PROJE(string numara_proje,string isim_proje,string yoneten_firma_proje,string sorumlu_proje,string kontrol_proje){
	this->numara_proje = numara_proje;
	this->isim_proje = isim_proje;
	this->yoneten_firma_proje = yoneten_firma_proje;
	this->sorumlu_proje = sorumlu_proje;
	this->kontrol_proje = kontrol_proje;
}
PROJE::PROJE(){
	numara_proje = '0';
	isim_proje = "Proje Yok";
	yoneten_firma_proje = "Firma Yok";
	sorumlu_proje = "Yok";
	kontrol_proje = "Yok";
}
HAKEDIS::HAKEDIS(){
	numara_proje = '0';
	periyot = '0';
}
HAKEDIS::HAKEDIS(string numara_urun,string eon){
	numara_proje = numara_urun;
	periyot = eon;
}
void HAKEDIS::sil_urun(string numara_urun){
	vector<URUN>::iterator tasi;
	vector<int>::iterator tasi2;
	tasi = ikinci_eller.begin();
	tasi2 = total_tutarlar.begin();
	while(tasi != ikinci_eller.end()){
		if(tasi->numara_urun == numara_urun ){
			ikinci_eller.erase(tasi); 
			total_tutarlar.erase(tasi2);
		}
		else{
			tasi++;
			tasi2++;
		}
	}
}
void HAKEDIS::ekle_urun(URUN& ekle_urun,int tutar){
	ikinci_eller.push_back(ekle_urun);
	total_tutarlar.push_back(tutar);
}
void HAKEDIS::listele_urun(){
	for(int i=0;i<ikinci_eller.size();i++)
		yazdir_urun(ikinci_eller[i]);
}
URUN& HAKEDIS::ara_urun(string numara_urun,int &pos_numara){
	for(int i=0;i<ikinci_eller.size();i++)
		if(ikinci_eller[i].numara_urun == numara_urun){
			pos_numara = i;
			return urunler[i];
		}
	URUN* bos_olan_urun = new URUN();
	return *bos_olan_urun;
}
void ekle_hakedis(HAKEDIS& hakedis){
	hakedisler.push_back(hakedis);
}
void guncelle_urun(){
	ofstream kaynak;
	kaynak.open("malzemeler.txt");
	for(int i=0;i<urunler.size();i++)
		kaynak <<urunler[i].numara_urun<<" "<<urunler[i].isim_urun<<" "<<urunler[i].adet<<" "<<urunler[i].adet_fiyati<<" "<<urunler[i].marka<<endl;
	kaynak.close();
}
void guncelle_proje(){
	ofstream kaynak;
	kaynak.open("projeler.txt");
	for(int i=0;i<projeler.size();i++)
		kaynak<<projeler[i].numara_proje<<" "<<projeler[i].isim_proje<<" "<<projeler[i].yoneten_firma_proje<<" "<<projeler[i].sorumlu_proje<<" "<<projeler[i].kontrol_proje<<endl;
	kaynak.close();
}
void guncelle_hakedis(){
	ofstream kaynak;
	kaynak.open("hakedis.txt");
	for(int i=0;i<hakedisler.size();i++){
		kaynak << hakedisler[i].numara_proje << " "<<hakedisler[i].periyot<<" ";
		for(int j=0;j<hakedisler[i].ikinci_eller.size();j++){
			if(j != hakedisler[i].ikinci_eller.size()-1)
				kaynak << hakedisler[i].ikinci_eller[j].numara_urun<<"-"<<hakedisler[i].total_tutarlar[j]<<",";
			else
				kaynak << hakedisler[i].ikinci_eller[j].numara_urun<<"-"<<hakedisler[i].total_tutarlar[j]<<endl;
		}
	}
	kaynak.close();
}

int main(){
	string numara_urun;
	string isim_urun;
	string adet;
	float adet_fiyati;
	string marka;
	ifstream malzeme_kaynak;
	malzeme_kaynak.open("malzeme.txt");
	while(malzeme_kaynak>>numara_urun){
		malzeme_kaynak  >> isim_urun >> adet >> adet_fiyati >> marka;
		URUN urun = URUN(numara_urun,isim_urun,adet,adet_fiyati,marka);
		ekle_urun(urun);
	}
	malzeme_kaynak.close();

	string numara_proje;
	string isim_proje;
	string isim_firma;
	string projeden_sorumlu_kisi;
	string projeyi_kontrol_eden_kisi;
	ifstream proje_kaynak;
	proje_kaynak.open("projeler.txt");
	while(proje_kaynak>>numara_proje){
		proje_kaynak  >> isim_proje >> isim_firma >> projeden_sorumlu_kisi >> projeyi_kontrol_eden_kisi;
		PROJE proje = PROJE(numara_proje,isim_proje,isim_firma,projeden_sorumlu_kisi,projeyi_kontrol_eden_kisi);
		ekle_proje(proje);
	}
	proje_kaynak.close();

	ifstream hakedis_kaynak;
	hakedis_kaynak.open("hakedis.txt");
	string satir;
	while(getline(hakedis_kaynak,satir)){
		stringstream fin(satir);
		string numara_proje;
		string periyot;
		vector<string> temps;
		fin>>numara_proje>>periyot;
		HAKEDIS hakedis = HAKEDIS(numara_proje,periyot);
		string temp;
		while(getline(fin,temp,',')){
			temps.push_back(temp);
			string numara_urun;
			string tutar;
			stringstream gin(temp);
			getline(gin,numara_urun,'-');
			stringstream tin(numara_urun);
			string numara_urun_2;
			tin>>numara_urun_2; 
			URUN urun = ara_urun(numara_urun_2);
			getline(gin,tutar);
			int adet_rakam = stoi(tutar);
			hakedis.ekle_urun(urun,adet_rakam);
		}
		ekle_hakedis(hakedis);
	}
	hakedis_kaynak.close();

	int tercih = 9;
	int alt_tercih = 9;
	while(1){
		cout<<" Merhaba !! "<<endl;
		cout<<" 1) Urun islemleri icin " <<endl;
		cout<<" 2) Proje islemleri icin "<<endl;
		cout<<" 3) Hakkedis islemleri icin"<<endl;
		cout<<" 4) Genel istenenler işlemleri icin"<<endl<<endl;
		cout<<" Cikmak icin 0 (sifir)'a basiniz"<<endl;
		cin>>tercih;
		if(tercih != 1 && tercih != 2 && tercih != 3 && tercih != 4 && tercih != 0){
			cout<<"Tekrar Deneyin!"<<endl<<endl;
			continue;
		}
		if(tercih == 0) break;
		if(tercih == 1){
			while(1){
				cout<<"1) Urun ekle "<<endl;
				cout<<"2) Urun sil "<<endl;
				cout<<"3) Urun ara"<<endl;
				cout<<"4) Mevcut urunleri rapaorla"<<endl;
				cout<<"5) Ust menuye gec"<<endl;
				cin>>alt_tercih;
				if(alt_tercih != 1 && alt_tercih != 2 && alt_tercih != 3 && alt_tercih != 4 && alt_tercih != 5){
					cout<<"Tekrar Deneyin!"<<endl<<endl;
					continue;
				}
				if(alt_tercih == 5) break;
				if(alt_tercih == 1){
					cout<<"Urun numara: ";
					cin>>numara_urun;
					cout<<"Urun isim: ";
					cin>>isim_urun;
					cout<<"Adet: ";
					cin>>adet;
					cout<<"Adet fiyati: ";
					cin>>adet_fiyati;
					cout<<"Marka: ";
					cin>>marka;

					URUN urun = URUN(numara_urun,isim_urun,adet,adet_fiyati,marka);
					ekle_urun(urun);
					raporla_urun();
					guncelle_urun();
				}
				if(alt_tercih == 2){
					string numara_urun;
					cout<<"Silinecek urunun numarasini giriniz: ";
					cin>>numara_urun;
					sil_urun(numara_urun);
					guncelle_urun();
				}
				if(alt_tercih == 3){
					string numara_urun;
					cout<<"Aranacak urunun numarasını giriniz: ";
					cin>>numara_urun;
					yazdir_urun(ara_urun(numara_urun));
				}
				if(alt_tercih ==  4){
					raporla_urun();
					cout<<"Rapor yazdirildi"<<endl;
				}
			}
			if(alt_tercih == 5) continue;
		}
		if(tercih == 2){
			alt_tercih = 9;
			while(1){
				cout<<"1) Proje ekle "<<endl;
				cout<<"2) Proje sil"<<endl;
				cout<<"3) Proje ara"<<endl;
				cout<<"4) Raporla"<<endl;
				cout<<"5) Ust Menuye Gec !!"<<endl;
				cin>>alt_tercih;
				if(alt_tercih != 1 && alt_tercih != 2 && alt_tercih != 3 && alt_tercih != 4 && alt_tercih != 5){
					cout<<"Tekrar Deneyin!"<<endl<<endl;
					continue;
				}
				if(alt_tercih == 5) break;
				if(alt_tercih == 1){
					string yurutucu_firma;
					cout<<"Projenin numarasi: "; cin>>numara_urun;
					cout<<"Projenin isimi: "; cin>>isim_urun;
					cout<<"Projeyi yuruten firma: "; cin>>yurutucu_firma;
					cout<<"Projeden sorumlu kisi: "; cin>>projeden_sorumlu_kisi;
					cout<<"Projeyi kontrol eden kisi: "; cin>>projeyi_kontrol_eden_kisi;

					PROJE proje_kaynak = PROJE(numara_urun,isim_urun,yurutucu_firma,projeden_sorumlu_kisi,projeyi_kontrol_eden_kisi);
					ekle_proje(proje_kaynak);
					guncelle_proje();
				}
				if(alt_tercih == 2){
					string numara_proje;
					cout<<"Silinecek projenin numarasini giriniz:"<<endl;
					cin>>numara_proje;
					sil_proje(numara_proje);
					guncelle_proje();
				}
				if(alt_tercih == 3){
					string numara_proje;
					cout<<"Aranacak projenin numarasini giriniz: "<<endl;
					cin>>numara_proje;
					cout<<"Aradığınız proje_kaynak :"<<endl;
					yazdir_proje(ara_proje(numara_proje));
				}
				if(alt_tercih == 4){
					cout<<"Raporunuz hazirlaniyor..."<<endl;
					raporla_proje();
				}
			}
			if(alt_tercih == 5){
				continue;
			}
		}
		if(tercih == 3){
			alt_tercih = 9;
			while(1){
				cout<<"1) Urun ekle"<<endl;
				cout<<"2) Urun sil"<<endl;
				cout<<"3) Urun guncelle"<<endl;
				cout<<"4) Urun listele"<<endl;
				cout<<"5) Urun ara"<<endl;
				cout<<"6) Ust Menuye Gec !!"<<endl;
				cin>>alt_tercih;
				if(alt_tercih != 1 && alt_tercih != 2 && alt_tercih != 3 && alt_tercih != 4 && alt_tercih != 5 && alt_tercih != 6){
					cout<<"Tekrar Deneyin!"<<endl<<endl;
					continue;
				}
				if(alt_tercih == 6) break;
				if(alt_tercih == 1){
					cout<<"Eklemek istediğiniz urunun kullanıldığı projenin numarasını,donemini ve urunun numarasını ve urun adedini sırasıyla giriniz:";
					string numara_proje,periyot,numara_urun;
					int tutar,durum=1;
					cin>>numara_proje>>periyot>>numara_urun;
					cin>>tutar;
					for(int i=0;i<hakedisler.size();i++){
						if(hakedisler[i].numara_proje == numara_proje && hakedisler[i].periyot == periyot){
							hakedisler[i].ikinci_eller.push_back(ara_urun(numara_urun));
							hakedisler[i].total_tutarlar.push_back(tutar);
							durum = 0;
						}
					}
					if(durum){
						HAKEDIS hakedis = HAKEDIS(numara_proje,periyot);
						URUN urun = ara_urun(numara_urun);
						hakedis.ekle_urun(urun,tutar);
						ekle_hakedis(hakedis);
					}
					guncelle_hakedis();
				}
				if(alt_tercih == 2){
					string numara_urun;
					string numara_proje;
					string periyot;
					cout<<"Silmek istediginiz urunun kullanılığı proje_kaynak numarasini, donemini ve urunun numarasini giriniz aralarında bir boşluk bırakarak: ";
					cin>>numara_proje>>periyot>>numara_urun;
					vector<HAKEDIS>::iterator tasi = hakedisler.begin();
					for(int i=0;i<hakedisler.size();i++){
						if(hakedisler[i].numara_proje == numara_proje && hakedisler[i].periyot == periyot){
							hakedisler[i].sil_urun(numara_urun);
							if(hakedisler[i].ikinci_eller.size() == 0){
								hakedisler.erase(tasi);
							}
						}
						else tasi++;
					}
					guncelle_hakedis();
				}
				if(alt_tercih == 3){
					string numara_urun;
					string numara_proje;
					string periyot;
					int tercih,durum = 0;
					int i,j;
					URUN urun;
					cout<<"Guncellemek istediginiz urunun kullanildigi projenin numarasini, donemini ve urun numarasini girin"<<endl;
					cin>>numara_proje>>periyot>>numara_urun;
					for(i=0;i<hakedisler.size();i++){
						if(hakedisler[i].numara_proje == numara_proje && hakedisler[i].periyot == periyot){
							for(j=0;j<hakedisler[i].ikinci_eller.size();j++)
								if(hakedisler[i].ikinci_eller[j].numara_urun == numara_urun){
									durum = 1;
									break;
								}
							if(durum)
								break;
						}
					}
					cout<<"1) Urun degistirmek icin"<<endl;
					cout<<"2) Urun tutarini degistirmek icin"<<endl;
					cin>>tercih;
					switch(tercih){
						case 1:
						{
							cout<<"Yeni urunun numarasini giriniz: ";
							string yeni_numara;
							cin>>yeni_numara;
							hakedisler[i].ikinci_eller[j] = ara_urun(yeni_numara);
							break;
						}						
						case 2:
						{
							cout<<"Urunun yeni adedini giriniz: "<<endl;
							int yeni_tutar;
							cin>>yeni_tutar;
							hakedisler[i].total_tutarlar[j] = yeni_tutar;
							break;
						}
					}
					guncelle_hakedis();
				}
				if(alt_tercih == 4){
					cout<<"Proje numarisini ve donemi giriniz: "<<endl;
					string numara_proje,periyot;
					cin>>numara_proje>>periyot;
					for(int i=0;i<hakedisler.size();i++){
						if(hakedisler[i].numara_proje == numara_proje && hakedisler[i].periyot == periyot){
							cout<<"Urun numara_urun Urun Adi adet adet Fiyati marka Adedi"<<endl;
							for(int j=0;j<hakedisler[i].ikinci_eller.size();j++){
								cout<<hakedisler[i].ikinci_eller[j].numara_urun<<" "<<hakedisler[i].ikinci_eller[j].isim_urun<<" "<<hakedisler[i].ikinci_eller[j].adet<<" "<<hakedisler[i].ikinci_eller[j].adet_fiyati<<" "<<hakedisler[i].ikinci_eller[j].marka<<" "<<hakedisler[i].total_tutarlar[j]<<endl;	
							}
						}
					}
				}
				if(alt_tercih == 5){
					cout<<"Aramak istediğiniz urunun kullanıldığı proje_kaynak numarasini, donemini ve urunun numarasini sirasiyla giriniz: "<<endl;
					string numara_proje,periyot,numara_urun;
					cin>>numara_proje>>periyot>>numara_urun;
					for(int i=0;i<hakedisler.size();i++){
						if(hakedisler[i].numara_proje == numara_proje && hakedisler[i].periyot == periyot){
							int pos_numara;
							URUN urun = hakedisler[i].ara_urun(numara_urun,pos_numara);
							cout<<"Urun numara_urun Urun Adi adet adet Fiyati marka Adedi"<<endl;
							cout<<urun.numara_urun<<" "<<urun.isim_urun<<" "<<urun.adet<<" "<<urun.adet_fiyati<<" "<<urun.marka<<" "<<hakedisler[i].total_tutarlar[pos_numara]<<endl;

						}
					}
				}
			}
			if(alt_tercih == 6){
				continue;
			}
		}
		if(tercih == 4){
			alt_tercih = 9;
			while(1){
				cout<<"1) Proje secip hakedis doneminde kullanilan urunlerin listesine, onların tutarlarına ve toplam tutara ulasmak icin"<<endl;
				cout<<"2) Kayitli projelerin belirtilen periyot icin hakedis tutarlarını raporlamak icin"<<endl;
				cout<<"3) Ust Menuye Donmek icin"<<endl;
				cin>>alt_tercih;
				if(alt_tercih != 1 && alt_tercih != 2 && alt_tercih != 3){
					cout<<"Tekrar Deneyin!"<<endl<<endl;
					continue;
				}
				if(alt_tercih == 3) break;
				if(alt_tercih == 1){
					cout<<"Proje numarasini ve hakedis donemini giriniz: "<<endl;
					string numara_proje,periyot;
					cin>>numara_proje>>periyot;
					float toplam = 0;
					for(int i=0;i<hakedisler.size();i++){
						if(hakedisler[i].numara_proje == numara_proje && hakedisler[i].periyot == periyot){
							cout<<"Urun numara Urun Adi adet adet Fiyati marka Adedi Tutari"<<endl;
							for(int j=0;j<hakedisler[i].ikinci_eller.size();j++){			
								cout<<hakedisler[i].ikinci_eller[j].numara_urun<<" "<<hakedisler[i].ikinci_eller[j].isim_urun<<" "<<hakedisler[i].ikinci_eller[j].adet<<" "<<hakedisler[i].ikinci_eller[j].adet_fiyati<<" "<<hakedisler[i].ikinci_eller[j].marka<<" "<<hakedisler[i].total_tutarlar[j]<<" "<<hakedisler[i].ikinci_eller[j].adet_fiyati*hakedisler[i].total_tutarlar[j]<<endl;
								toplam += hakedisler[i].ikinci_eller[j].adet_fiyati*hakedisler[i].total_tutarlar[j];			
							}
						}
					}
					cout<<"Toplam tutar: "<<toplam<<endl;
				}
				if(alt_tercih == 2){
					string periyot;
					cout<<"Göstermek istedğiniz donemi giriniz: "<<endl;
					cin>>periyot;
					cout<<"Kayitli projelerin toplam hakedisleri gosteriliyor..."<<endl;
					cout<<"Numara Adi Yürütücüsü Sorumlusu Kontroloru Total Hakedisi"<<endl;
					for(int i=0;i<projeler.size();i++){
						int toplam = 0;
						for(int j=0;j<hakedisler.size();j++){
							if(hakedisler[j].numara_proje == projeler[i].numara_proje && hakedisler[j].periyot == periyot){
								for(int k=0;k<hakedisler[j].ikinci_eller.size();k++){
									toplam+= hakedisler[j].ikinci_eller[k].adet_fiyati*hakedisler[j].total_tutarlar[k];
								}
							}
						}
						cout<<projeler[i].numara_proje<<"  "<<projeler[i].isim_proje<<" "<<projeler[i].yoneten_firma_proje<<" "<<projeler[i].sorumlu_proje<<" "<<projeler[i].kontrol_proje<<" "<<toplam<<endl;
					}
				}
			}
			if(alt_tercih == 3) continue;
		}
	}
	system("pause");
	return 0;
}