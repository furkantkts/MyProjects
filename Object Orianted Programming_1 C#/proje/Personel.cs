/****************************************************************************
**					SAKARYA ÜNİVERSİTESİ
**				BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ
**				    BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ
**				   NESNEYE DAYALI PROGRAMLAMA DERSİ
**					2014-2015 BAHAR DÖNEMİ
**	
**				ÖDEV NUMARASI..........:1
**				ÖĞRENCİ ADI............:Furkan Tektaş
**				ÖĞRENCİ NUMARASI.......:B181210049
**                         DERSİN ALINDIĞI GRUP...:1-B
****************************************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace proje
{
    class Personel
    {
        //text dosyasındaki her veriyi kaydetmek için 'Personel' adlı sınıf uyarlandık//
        public long tc;
        public string ad;
        public string soyad;
        public int yas;
        public int calısmaSuresi;
        public string evlilikDurumu;
        public string esiCalisiyorMu;
        public int cocukSayisi;
        public int tabanMaas;
        public int makamTazminat;
        public int idariGorevTazminat;
        public int fazlaMesaiSaati;
        public int fazlaMesaiSaatUcret;
        public int vergiMatrahı;
        public int brutMaas;
        public int damgaVergisi;
        public int emekliKesintisi;
        public int gelirVergisi;
        public int netMaas;


        public void degerAta(Personel x, string[] a)
        {
            //Personel bilgileri kimlik bilgisine göre metod ile atandı//
            if (x.tc == 14185637752)
            {
                x.ad = a[1];
                x.soyad = a[2];
                x.yas = Convert.ToInt32(a[3]);
                x.calısmaSuresi = Convert.ToInt32(a[4]);
                x.evlilikDurumu = a[5];
                x.esiCalisiyorMu = a[6];
                x.cocukSayisi = Convert.ToInt32(a[7]);
                x.tabanMaas = Convert.ToInt32(a[8]);
                x.makamTazminat = Convert.ToInt32(a[8]);
                x.idariGorevTazminat = Convert.ToInt32(a[9]);
                x.fazlaMesaiSaati = Convert.ToInt32(a[10]);
                x.fazlaMesaiSaatUcret = Convert.ToInt32(a[11]);
                x.vergiMatrahı = Convert.ToInt32(a[12]);
            }
            
            if (x.tc == 15348759668)
            {
                x.ad = a[15];
                x.soyad = a[16];
                x.yas = Convert.ToInt32(a[17]);
                x.calısmaSuresi = Convert.ToInt32(a[18]);
                x.evlilikDurumu = a[19];
                x.esiCalisiyorMu = a[20];
                x.cocukSayisi = Convert.ToInt32(a[21]);
                x.tabanMaas = Convert.ToInt32(a[22]);
                x.makamTazminat = Convert.ToInt32(a[23]);
                x.idariGorevTazminat = Convert.ToInt32(a[24]);
                x.fazlaMesaiSaati = Convert.ToInt32(a[25]);
                x.fazlaMesaiSaatUcret = Convert.ToInt32(a[26]);
                x.vergiMatrahı = Convert.ToInt32(a[27]);
            }
            if (x.tc == 15184795563)
            {
                x.ad = a[29];
                x.soyad = a[30];
                x.yas = Convert.ToInt32(a[31]);
                x.calısmaSuresi = Convert.ToInt32(a[32]);
                x.evlilikDurumu = a[33];
                x.esiCalisiyorMu = a[34];
                x.cocukSayisi = Convert.ToInt32(a[35]);
                x.tabanMaas = Convert.ToInt32(a[36]);
                x.makamTazminat = Convert.ToInt32(a[37]);
                x.idariGorevTazminat = Convert.ToInt32(a[38]);
                x.fazlaMesaiSaati = Convert.ToInt32(a[39]);
                x.fazlaMesaiSaatUcret = Convert.ToInt32(a[40]);
                x.vergiMatrahı = Convert.ToInt32(a[41]);
            }
        }
        public void maasHesapla(Personel y)
        {
            //Evlilik durumuna göre maaş hesabı yapıldı//
            if (y.evlilikDurumu == "H")
                y.brutMaas= y.tabanMaas + y.makamTazminat + y.idariGorevTazminat + y.cocukSayisi * 30 + y.fazlaMesaiSaati * y.fazlaMesaiSaatUcret;
            if (y.evlilikDurumu == "E" && y.esiCalisiyorMu == "E")
                y.brutMaas= y.tabanMaas + y.makamTazminat + y.idariGorevTazminat + y.cocukSayisi * 30 + y.fazlaMesaiSaati * y.fazlaMesaiSaatUcret;
            if(y.evlilikDurumu == "E" && y.esiCalisiyorMu == "H")
                y.brutMaas= y.tabanMaas + y.makamTazminat + y.idariGorevTazminat+200+ y.cocukSayisi * 30 + y.fazlaMesaiSaati * y.fazlaMesaiSaatUcret;

            //Gelir vergisi gelir matrahına göre ayarlandı//
            if (y.brutMaas < 10000)
                y.gelirVergisi = brutMaas * 15 / 100;
            if (y.brutMaas >= 10000 || y.brutMaas<20000)
                y.gelirVergisi = brutMaas * 20 / 100;
            if (y.brutMaas >= 20000 || y.brutMaas<30000)
                y.gelirVergisi = brutMaas * 25 / 100;
            if (y.brutMaas >=30000)
                y.gelirVergisi = brutMaas * 30 / 100;

            y.damgaVergisi = y.brutMaas * 10 / 100;//Damga vergisi//
            y.emekliKesintisi = y.brutMaas * 15 / 100;//Damga vergisi//
            y.netMaas = y.brutMaas - (y.emekliKesintisi + y.damgaVergisi+y.gelirVergisi);//Net gelir elde edildi..//
        }
    }
}
   
