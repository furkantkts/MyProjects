/****************************************************************************
**					SAKARYA ÜNİVERSİTESİ
**				BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ
**				    BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ
**				   NESNEYE DAYALI PROGRAMLAMA DERSİ
**					2018-2019 BAHAR DÖNEMİ
**	
**				ÖDEV NUMARASI..........:2
**				ÖĞRENCİ ADI............:FURKAN TEKTAŞ
**				ÖĞRENCİ NUMARASI.......:B181210049
**              DERSİN ALINDIĞI GRUP...:1-B
****************************************************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace futbol
{
    class Forvet:Futbolcu
    {

        private int Bitiricilik;
        private int IlkDokunus;
        private int Kafa;
        private int OzelYetenek;
        private int Sogukkanlilik;

        public int BİTİRİCİLİK
        {
            get { return Bitiricilik; }
            set
            {
                Random rnd = new Random();
                int deger = rnd.Next(70, 100);
                Bitiricilik = deger;
            }
        }
        public int ILKDOKUNUS
        {
            get { return IlkDokunus; }
            set
            {
                Random rnd = new Random();
                int deger = rnd.Next(70, 100);
                IlkDokunus = deger;
            }
        }
        public int KAFA
        {
            get { return Kafa; }
            set
            {
                Random rnd = new Random();
                int deger = rnd.Next(70, 100);
                Kafa = deger;
            }
        }
        public int OZELYETENEK
        {
            get { return OzelYetenek; }
            set
            {
                Random rnd = new Random();
                int deger = rnd.Next(70, 100);
                OzelYetenek = deger;
            }
        }
        public int SOGUKKANLİLİK
        {
            get { return Sogukkanlilik; }
            set
            {
                Random rnd = new Random();
                int deger = rnd.Next(70, 100);
                Sogukkanlilik = deger;
            }
        }
        public Forvet(string name, int forNo):base(name,forNo)//kurucu ile oyuncular ilk oluşturulduğunda parametre değerleri ile atamaları yapıldı//
        {
            Random rastgele = new Random();
            Bitiricilik = BİTİRİCİLİK;
            IlkDokunus = ILKDOKUNUS;
            Kafa = KAFA;
            OzelYetenek = OZELYETENEK;
            Sogukkanlilik = SOGUKKANLİLİK;
        }
        public override void Pasver()
        {
            double PasSkorS = Pas * 0.3 + Yetenek * 0.2 + OzelYetenek * 0.2 + Dayaniklik * 0.1 + DogalForm * 0.1 + Sans * 0.1;

            PasSkor = PasSkorS;                           
        }
        public override void GolVurusu()
        {
            double GolSkorS = Yetenek * 0.2 + OzelYetenek * 0.2 + Sut * 0.1 + Kafa * 0.1 + 
            IlkDokunus * 0.1 + Bitiricilik * 0.1 + Sogukkanlilik * 0.1 + Kararlik * 0.1 + DogalForm * 0.1 + Sans * 0.1;

           GolSkor = GolSkorS;                    
        }

    }
}
