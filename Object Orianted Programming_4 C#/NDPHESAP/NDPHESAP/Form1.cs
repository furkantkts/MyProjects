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
**              DERSİN ALINDIĞI GRUP...:1B
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
using System.Text.RegularExpressions;

namespace NDPHESAP
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }


        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            var nums = textBox1.Text.Split("/*-+".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);//İşlemler arasındaki karakterler değişkene aktarılıyor..//
            var otps = Regex.Split(textBox1.Text, @"\d", RegexOptions.None).Where(p => p != "").ToArray<string>();
            List<string> sayilar = new List<string>();
            foreach (string num in nums)
            {
                sayilar.Add(num);
            }
            List<string> operators = new List<string>();//Bir string listesi oluşturuluyor.
            foreach (string otp in otps)
            {
                operators.Add(otp);//işlemler arası her ifade listeye aktarıldı.
            }

            double ilksayi = double.Parse(sayilar[0]);//textbox'taki ilk karakter(işleme kadarki) ilk sayı olarak alınıyor//
            double deger = 0;
            for (int i = 0; i < operators.Count; i++)
            {
                switch (operators[i])
                {
                    case "*"://işlem önceliği adına
                        if (i + 1 < sayilar.Count)//tüm sayılara kadar git.
                        {
                            deger = (double.Parse(sayilar[i]) * double.Parse(sayilar[i + 1]));//İşlemin bir önceki ve bir sonraki elemanları çarpıldı.
                            sayilar[i] = Convert.ToString(deger);//sonuç alındı.
                            sayilar.RemoveAt(i + 1);//bir sonraki sayı atıldı.
                            operators.Remove("*");//diğer işlemlere geçildi.
                            i = -1;//diğer işlemler adına başa dönüldü.
                        }
                        break;
                    case "/"://işlem önceliği adına
                        if (i + 1 < sayilar.Count)//tüm sayılara kadar git.
                        {
                            deger = (double.Parse(sayilar[i]) / double.Parse(sayilar[i + 1]));//İşlemin bir önceki ve bir sonraki elemanları bölündü.
                            sayilar[i] = Convert.ToString(deger);//sonuç alındı.
                            sayilar.RemoveAt(i + 1);//bir sonraki sayı atıldı.
                            operators.Remove("/");//diğer işlemlere geçildi.
                            i = -1;//diğer işlemler adına başa dönüldü.
                        }
                        break;
                }
            }

            double toplam = 0;
            for (int i = 0; i < operators.Count; i++)
            {
                switch (operators[i])
                {
                    case "+":
                        if (i + 1 < sayilar.Count)//tüm sayılara kadar git.
                        {
                            deger = (double.Parse(sayilar[i]) + double.Parse(sayilar[i + 1]));//İşlemin bir önceki ve bir sonraki elemanları çıkarıldı.
                            sayilar[i] = Convert.ToString(deger);//sonuç alındı.
                            sayilar.RemoveAt(i + 1);//bir sonraki sayı atıldı.
                            operators.Remove("+");//diğer işlemlere geçildi.
                            i = -1;//diğer işlemler adına başa dönüldü.
                        }
                        break;
                    case "-":
                        if (i + 1 < sayilar.Count)//tüm sayılara kadar git.
                        {
                            deger = (double.Parse(sayilar[i]) - double.Parse(sayilar[i + 1]));//İşlemin bir önceki ve bir sonraki elemanları çıkarıldı.
                            sayilar[i] = Convert.ToString(deger);//sonuç alındı.
                            sayilar.RemoveAt(i + 1);//bir sonraki sayı atıldı.
                            operators.Remove("-");//diğer işlemlere geçildi.
                            i = -1;//diğer işlemler adına başa dönüldü.
                        }
                        break;
                }
            }
            textBox2.Text = sayilar[0];
        }
    }
}
