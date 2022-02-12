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
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace proje
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Personel p1 = new Personel();
        Personel p2 = new Personel();
        Personel p3 = new Personel();
           
        private void personelEkleButton_Click(object sender, EventArgs e)
        {
                   Stream myStream;
                    OpenFileDialog openFileDialog1 = new OpenFileDialog();//Dosya secme ekranı açıldı//
                      if (openFileDialog1.ShowDialog()==System.Windows.Forms.DialogResult.OK)//Dosya seçildi.//              
                     {
                        if ((myStream=openFileDialog1.OpenFile())!=null)//Kontrol ediliyor//
                        {
                           string dosya = openFileDialog1.FileName;//Dosya adı değiskene atandı.//
                           string metin = File.ReadAllText(dosya);//Dosyadaki tüm metin okundu ve 'metin' adlı değişkene atandı//
                           richTextBox1.Text = metin;//'metin' adlı değisken richtextbox1 ekranına gönderildi//
                        }
                     }
        }

        private void maasHesaplaButton_Click(object sender, EventArgs e)
        {
            p1.tc = 14185637752; //Kimlik atamaları yapıldı.//
            p2.tc = 15348759668;
            p3.tc = 15184795563;

            if (textBox1.Text == p1.tc.ToString())
            {
                p1.maasHesapla(p1);//İlgili personelin maasi fonksiyon verilerek hesaplanıyor..//
                maasLabel.Text = p1.ad+"'in net maaşı :" + p1.netMaas.ToString() + "TL";//Yazdırılıyor..//
                damgaLabel.Text = "Damga vergisi :"+p1.damgaVergisi.ToString() + "TL";
                emekliLabel.Text = "Emekli kesintisi :"+p1.emekliKesintisi.ToString() + "TL";
                brutLabel.Text = "Brüt maaş :"+p1.brutMaas.ToString() + "TL";
            }
            if (textBox1.Text == p2.tc.ToString())//Kontrol//
            {
                p2.maasHesapla(p2);//Hesaplama//
                maasLabel.Text = p2.ad+"'in net maaşı :" + p2.netMaas.ToString() + "TL";//Yazdırma//
                damgaLabel.Text = "Damga vergisi :" + p2.damgaVergisi.ToString() + "TL";
                emekliLabel.Text = "Emekli kesintisi :" + p2.emekliKesintisi.ToString() + "TL";
                brutLabel.Text = "Brüt maaş :" + p2.brutMaas.ToString() + "TL";
            }
            if (textBox1.Text == p3.tc.ToString())
            {
                p3.maasHesapla(p3);//İlgili personelin maasi fonksiyon verilerek hesaplanıyor..//
                maasLabel.Text = p3.ad+"'in net maaşı :"+ p3.netMaas.ToString() + "TL";//Yazdırılıyor..//
                damgaLabel.Text = "Damga vergisi :" + p3.damgaVergisi.ToString() + "TL";
                emekliLabel.Text = "Emekli kesintisi :" + p3.emekliKesintisi.ToString() + "TL";
                brutLabel.Text = "Brüt maaş :" + p3.brutMaas.ToString() + "TL";
            }
        }

        private void araButton_Click(object sender, EventArgs e)
        {
            p1.tc = 14185637752;  //Kimlik atamaları yapıldı.//
            p2.tc = 15348759668;
            p3.tc = 15184795563;

            string[] satirlar;
            string hepsi = richTextBox1.Text;
            satirlar = hepsi.Split(' ');

            if (textBox1.Text == p1.tc.ToString())//Girilen kimliğin kime ait olduğu kontrol ediliyor..//
            {
                p1.degerAta(p1, satirlar);//Ait olunan personelin bilgileri atanıyor..//
                for (int i = 1; i < 14; i++)
                    textBox2.Text += satirlar[i].ToString() + " ";//Döngü ile ilgili bölüme bilgiler yazdırılıyor..//
                    
            }
            if (textBox1.Text == p2.tc.ToString())//Kontrol//
            {
                p2.degerAta(p2, satirlar);//Atama//
                for (int j = 15; j < 28; j++)
                    textBox2.Text += satirlar[j].ToString() + " ";//Yazdırma//
            }
            if (textBox1.Text == p3.tc.ToString())//Kontrol//
            {
                p3.degerAta(p3, satirlar);//Atama//
                for (int k = 29; k < 42; k++)
                    textBox2.Text += satirlar[k].ToString() + " ";//Yazdırma//
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {            
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void maasLabel2_Click(object sender, EventArgs e)
        {

        }
    }
        
  }
    

