using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;

namespace Sağlık_Proje
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        int giris_hakki = 3;
        SqlConnection baglantim = new SqlConnection("Data Source=DESKTOP-VFNVPU7\\SQLEXPRESS;Initial Catalog=Eczane;Integrated Security=True");
        Hastalar[] hastalar = new Hastalar[100];
        Doktorlar[] doktorlar = new Doktorlar[100];
        int i = 0;

        private void GirisButton_Click(object sender, EventArgs e)
        {
            if (HastaRadioButton.Checked)
            {
                baglantim.Open();
                SqlCommand hastabul = new SqlCommand("select * from Hasta where HastaKullaniciAdi='" + textBox1.Text.ToString() + "'", baglantim);
                SqlDataReader hastaoku = hastabul.ExecuteReader();
                if (hastaoku.Read() == true)
                {
                    hastalar[i] = new Hastalar();
                    hastalar[i].hastaNo = int.Parse(hastaoku[0].ToString());
                    hastalar[i].hastaAdi = hastaoku[1].ToString();
                    hastalar[i].hastaSoyadi = hastaoku[2].ToString();
                    hastalar[i].hastaYas = int.Parse(hastaoku[3].ToString());
                    hastalar[i].hastaCinsiyet = hastaoku[4].ToString();
                    hastalar[i].hastaSifre = int.Parse(hastaoku[5].ToString());
                    hastalar[i].hastaKullaniciAdi = hastaoku[6].ToString();
                    if (hastalar[i].hastaSifre == int.Parse(textBox2.Text.ToString()))
                    {
                        HastaEkran.hasta_id = int.Parse(hastaoku[0].ToString());
                        HastaEkran hastaekrani = new HastaEkran();
                        this.Hide();
                        hastaekrani.Show();
                        baglantim.Close();
                    }
                    else
                    {
                        if (giris_hakki == 0)
                        {
                            MessageBox.Show("TÜM HAKLARINIZI KULLANDINIZ");
                            baglantim.Close();
                        }
                        else
                        {
                            MessageBox.Show("SAYIN " + hastalar[i].hastaAdi + " ŞİFRENİZ YANLIŞ");
                            giris_hakki--;
                            label4.Text = giris_hakki.ToString();
                            baglantim.Close();
                        }
                    }
                }
                else
                {
                    if (giris_hakki == 0)
                    {
                        MessageBox.Show("TÜM HAKLARINIZI KULLANDINIZ");
                        baglantim.Close();
                    }
                    else
                    {
                        MessageBox.Show("BÖYLE BİR KULLANICI BULUNAMADI");
                        giris_hakki--;
                        label4.Text = giris_hakki.ToString();
                        baglantim.Close();
                    }
                }
                
            }
            else if (DoktorRadiioButton.Checked)
            {
                baglantim.Open();
                SqlCommand doktorbul = new SqlCommand("select * from Doktor where DoktorKullaniciAdi='" + textBox1.Text.ToString() + "'", baglantim);
                SqlDataReader doktoroku = doktorbul.ExecuteReader();
                if (doktoroku.Read() == true)
                {
                    doktorlar[i] = new Doktorlar();
                    doktorlar[i].doktor_ID = int.Parse(doktoroku[0].ToString());
                    doktorlar[i].doktor_Adi = doktoroku[1].ToString();
                    doktorlar[i].doktor_Soyadi = doktoroku[2].ToString();
                    doktorlar[i].doktor_Unvan = doktoroku[3].ToString();
                    doktorlar[i].doktor_Yas = int.Parse(doktoroku[4].ToString());
                    doktorlar[i].doktor_Kullaniciadi = doktoroku[6].ToString();
                    doktorlar[i].doktor_Sifre = Convert.ToInt64(doktoroku[7].ToString());

                    if (doktorlar[i].doktor_Sifre == Convert.ToInt64((textBox2.Text.ToString())))
                    {
                        DoktorEkran.doktor_ID = int.Parse(doktoroku[0].ToString());                       
                        DoktorEkran doktorekran = new DoktorEkran();
                        this.Hide();
                        doktorekran.Show();
                        baglantim.Close();
                    }
                    else
                    {
                        if (giris_hakki == 0)
                        {
                            MessageBox.Show("TÜM HAKLARINIZI KULLANDINIZ");
                            baglantim.Close();
                        }
                        else
                        {
                            MessageBox.Show("SAYIN " + doktorlar[i].doktor_Adi + " ŞİFRENİZ YANLIŞ");
                            giris_hakki--;
                            label4.Text = giris_hakki.ToString();
                            baglantim.Close();
                        }
                    }
                }
                else
                {
                    if (giris_hakki == 0)
                    {
                        MessageBox.Show("TÜM HAKLARINIZI KULLANDINIZ");
                        baglantim.Close();
                    }
                    else
                    {
                        MessageBox.Show("BÖYLE BİR KULLANICI BULUNAMADI");
                        giris_hakki--;
                        label4.Text = giris_hakki.ToString();
                        baglantim.Close();
                    }
                }

            }


        }
        private void SifreDegisButton_Click(object sender, EventArgs e)
        {
            SifreDegisEkran sifredegismeekrani = new SifreDegisEkran();
            this.Hide();      
            sifredegismeekrani.Show();
            
        }

        private void KaydolButton_Click(object sender, EventArgs e)
        {
            KaydolEkran kaydolmaekrani = new KaydolEkran();
            this.Hide();        
            kaydolmaekrani.Show();
           
        }
    }
}
