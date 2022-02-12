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
    public partial class SifreDegisEkran : Form
    {
        public SifreDegisEkran()
        {
            InitializeComponent();
        }
        private void SifreDegisEkran_Load(object sender, EventArgs e)
        {

        }
        SqlConnection baglantim = new SqlConnection("Data Source=DESKTOP-VFNVPU7\\SQLEXPRESS;Initial Catalog=Eczane;Integrated Security=True");
        private void YeniSifreButton_Click(object sender, EventArgs e)
        {
            baglantim.Open();
            SqlCommand sifredegis = new SqlCommand("select *from Hasta where HastaKullaniciAdi='" + textBox1.Text.ToString() + "'", baglantim);
            SqlDataReader sifreoku = sifredegis.ExecuteReader();
            if (sifreoku.Read() == true)
            {
                Hastalar hastalar = new Hastalar();
                hastalar.hastaNo = int.Parse(sifreoku[0].ToString());
                hastalar.hastaAdi = sifreoku[1].ToString();
                hastalar.hastaSoyadi = sifreoku[2].ToString();
                hastalar.hastaYas = int.Parse(sifreoku[3].ToString());
                hastalar.hastaCinsiyet = sifreoku[4].ToString();
                hastalar.hastaSifre = int.Parse(sifreoku[5].ToString());
                hastalar.hastaKullaniciAdi = sifreoku[6].ToString();
                sifreoku.Close();
                if (textBox2.Text == hastalar.hastaSifre.ToString())
                {
                    if (textBox4.Text==textBox3.Text)
                    {
                        SqlCommand guncelle = new SqlCommand("update Hasta set HastaSifre='" + int.Parse(textBox3.Text.ToString()) + "' where HastaKullaniciAdi='" + textBox1.Text.ToString() + "' ", baglantim);
                        SqlDataReader yenilendi = guncelle.ExecuteReader();
                        yenilendi.Read();
                        MessageBox.Show("SAYIN "+hastalar.hastaAdi+" ŞİFRENİZ GÜNCELLENDİ");
                        baglantim.Close();
                    }
                    else
                    {
                        MessageBox.Show("LÜTFEN YENİ ŞİFRENİZİ TEKRAR GİRİN");
                        baglantim.Close();
                    }
                }
                else
                {
                    MessageBox.Show("MEVCUT ŞİFRENİZ HATALI");
                    baglantim.Close();
                }
            }
            else
            {
                MessageBox.Show("BÖYLE BİR PERSONEL BULUNAMADI");
                baglantim.Close();
            }

        }
    }
}
