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
    class Futbolcu
    {
        private string AdSoyad;
        private int FormaNo;
        public int Hiz;
        public int Dayaniklik;
        public int Pas;
        public int Sut;
        public int Yetenek;
        public int Kararlik;
        public int DogalForm;
        public int Sans;
        public double PasSkor;
        public double GolSkor;

        public string ADSOYAD
        {
           get { return AdSoyad; }
            set
            {
                AdSoyad = value;
            }
        }
        public int FORMANO
        {
            get { return FormaNo; }
            set
            {
                FormaNo = value;
            }
        }


        public Futbolcu(string AdSoyad, int FormaNo)//kurucu ile oyuncular ilk oluşturulduğunda parametre değerleri ile atamaları yapıldı//
        {
            ADSOYAD = AdSoyad;
            FORMANO = FormaNo;
            Random rasstgele = new Random();
            Hiz = rasstgele.Next(50, 100);
            Dayaniklik = rasstgele.Next(50, 100);
            Pas = rasstgele.Next(50, 100);
            Sut = rasstgele.Next(50, 100);
            Yetenek = rasstgele.Next(50, 100);
            Kararlik = rasstgele.Next(50, 100);
            DogalForm = rasstgele.Next(50, 100);
            Sans = rasstgele.Next(50, 100);
        }

        public virtual void Pasver()
        {
            double PasSkorF = Pas * 0.3 + Yetenek * 0.3 + Dayaniklik * 0.1 + DogalForm * 0.1 + Sans * 0.2;

            PasSkor = PasSkorF;
            }
        public virtual void GolVurusu()
        {
            double GolSkorF = Yetenek * 0.3 + Sut * 0.2 + Kararlik * 0.1 + DogalForm * 0.1 +
                    Hiz * 0.1 + Sans * 0.2;

            GolSkor = GolSkorF;
        }

    }
}
