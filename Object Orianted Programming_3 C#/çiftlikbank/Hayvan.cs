/****************************************************************************
**					SAKARYA ÜNİVERSİTESİ
**				BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ
**				    BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ
**				   NESNEYE DAYALI PROGRAMLAMA DERSİ
**					2018-2019 BAHAR DÖNEMİ
**	
**				ÖDEV NUMARASI..........:Proje-3
**				ÖĞRENCİ ADI............:FURKAN TEKTAŞ
**				ÖĞRENCİ NUMARASI.......:B181210049
**              DERSİN ALINDIĞI GRUP...:1-B
****************************************************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace çiftlikbank
{
     abstract class Hayvan
    {
        private int can;
        private int urunSayi;

        public int Can
        {
          get { return can; }
          set
            {
                can = value;
            }
        }
        public int UrunSayi
        {
            get { return urunSayi; }
            set
            {
                urunSayi = value;
            }
        }

    }
}
