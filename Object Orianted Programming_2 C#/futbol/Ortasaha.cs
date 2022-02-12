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
    class Ortasaha:Futbolcu
    {
        private int UzunTop;
        private int IlkDokunus;
        private int Uretkenlik;
        private int TopSurme;
        private int OzelYetenek;

        public int UZUNTOP
        {
            get { return UzunTop; }
            set
            {
                Random rnd = new Random();
                int deger = rnd.Next(70, 100);
                UzunTop = deger;
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
        public int URETKENLİK
        {
            get { return Uretkenlik; }
            set
            {
                Random rnd = new Random();
                int deger = rnd.Next(70, 100);
                Uretkenlik = deger;
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
        public int TOPSURME
        {
            get { return TopSurme; }
            set
            {
                Random rnd = new Random();
                int deger = rnd.Next(70, 100);
                TopSurme = deger;
            }
        }

        public Ortasaha(string name, int forNo) : base(name, forNo)//kurucu ile oyuncular ilk oluşturulduğunda parametre değerleri ile atamaları yapıldı//
        {
            Random rasgele = new Random();
            UzunTop = UZUNTOP;
            IlkDokunus = ILKDOKUNUS;
            Uretkenlik = URETKENLİK;
            TopSurme = TOPSURME;
            OzelYetenek = OZELYETENEK;
        }
        public override void Pasver()
        {
            double PasSkorO = Pas * 0.3 + Yetenek * 0.2 + OzelYetenek * 0.2 + Dayaniklik * 0.1 + DogalForm * 0.1 +
            UzunTop * 0.1 + TopSurme * 0.1 + Sans * 0.1;

            PasSkor = PasSkorO;        
        }
        public override void GolVurusu()
        {
            double GolSkorO = Yetenek * 0.3 + OzelYetenek * 0.2 + Sut * 0.2 + IlkDokunus * 0.1 +
            Kararlik * 0.1 + DogalForm * 0.1 + Sans * 0.1;

           GolSkor = GolSkorO;
        }
    }
}
