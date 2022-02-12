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
    class Defans:Futbolcu
    {
        public int PozisyonAlma;
        public int Kafa;
        public int Sicrama;

        public int POZISYONALMA
        {
            get { return PozisyonAlma; }
            set
            {
                Random rnd = new Random();
                int deger = rnd.Next(70, 100);
                PozisyonAlma = deger;
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
        public int SICRAMA
        {
            get { return Sicrama; }
            set
            {
                Random rnd = new Random();
                int deger = rnd.Next(70, 100);
                Sicrama = deger;
            }
        }

        public Defans(string name, int forNo) : base(name, forNo)//kurucu ile oyuncular ilk oluşturulduğunda parametre değerleri ile atamaları yapıldı//
        {
            Random rasttgele = new Random();
            PozisyonAlma = POZISYONALMA;
            Kafa = KAFA;
            Sicrama = SICRAMA;
        }
        public override void Pasver()
        {
            double PasSkorD = Pas * 0.3 + Yetenek * 0.3 + Dayaniklik * 0.1 + DogalForm * 0.1 + PozisyonAlma * 0.1 + Sans * 0.2;

            PasSkor = PasSkorD;            
        }
        public override void GolVurusu()
        {
            double GolSkorD = Yetenek * 0.3 + Sut * 0.2 + Kararlik * 0.1 + DogalForm * 0.1 + Kafa * 0.1 + Sicrama * 0.1 + Sans * 0.1;

           GolSkor = GolSkorD;
        }

    }
}
