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
using System.Media;
namespace çiftlikbank
{
     class Tavuk:Hayvan,IYap
    {
        public Tavuk()
        {
            Can = 100;
            UrunSayi = 0;
        }

        public void CanAzalt()
        {
            Can -= 2;
        }

        public void UrunArttir()
        {
            UrunSayi += 1;
        }
        public void sesAta()
        {
            SoundPlayer sesTavuk = new SoundPlayer();
            string yolTavuk = System.Windows.Forms.Application.StartupPath + "\\tavuk.wav";
            sesTavuk.SoundLocation = yolTavuk;
            sesTavuk.Play();
        }
    }
}
