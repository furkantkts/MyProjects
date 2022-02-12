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
using System.Data;

namespace Sağlık_Proje
{
    public partial class DoktorEkran : Form
    {
        public DoktorEkran()
        {
            InitializeComponent();
        }

        static public int hasta_ID;
        static public int ilac_Stok;
        static public int ilac_Fiyat;
        static public string ilac_Isim;
        static public int ilac_ID;
        static public int hastalik_ID;
        static public int doktor_ID;
        static public string doktor_Adi;
        static public string doktor_Soyadi;
        static public int doktor_Yas;
        static public string doktor_Unvan;
        static public int kayit_sayisi;
        static public int hangi_kayit;

        SqlConnection baglantim = new SqlConnection("Data Source=DESKTOP-VFNVPU7\\SQLEXPRESS;Initial Catalog=Eczane;Integrated Security=True");
        private void DoktorEkran_Load(object sender, EventArgs e)
        {
            button3.Enabled = false;
            baglantim.Open();
            SqlCommand doktorgetir = new SqlCommand(" DoktorGetir @DoktorID ", baglantim);
            doktorgetir.Parameters.Add("@DoktorID", doktor_ID);
            SqlDataReader okudoktor = doktorgetir.ExecuteReader();
            if (okudoktor.Read())
            {
                doktor_Adi = okudoktor[1].ToString();
                doktor_Soyadi = okudoktor[2].ToString();
                label1.Text = "SAYIN " + doktor_Adi + " " + doktor_Soyadi + " SİSTEME GİRİŞ YAPTINIZ";
                doktor_Unvan = okudoktor[3].ToString();
                doktor_Yas = Convert.ToInt32(okudoktor[4].ToString());
            }
            okudoktor.Close();

            SqlCommand randevugetir = new SqlCommand(" RandevuGetir @DoktorID ", baglantim);
            randevugetir.Parameters.Add("@DoktorID", doktor_ID);
            kayit_sayisi = Convert.ToInt32(randevugetir.ExecuteScalar().ToString());
            label3.Text = doktor_Unvan + " " + doktor_Adi + " " + doktor_Soyadi + " BEY " + kayit_sayisi + " ADET MUAYENE MEVCUT ";

            SqlCommand kayıtsırala = new SqlCommand(" KayitSirala @DoktorID ", baglantim);
            kayıtsırala.Parameters.Add("@DoktorID", doktor_ID);
            kayıtsırala.Parameters.AddWithValue(doktor_ID.ToString(), comboBox1.SelectedIndex + 1);
            SqlDataReader getir = kayıtsırala.ExecuteReader();
            while (getir.Read())
            {
                comboBox1.Items.Add(getir[0].ToString());
            }
            getir.Close();
            baglantim.Close();
        }
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            hangi_kayit = Convert.ToInt32(comboBox1.Text);

        }
        private void button1_Click(object sender, EventArgs e)
        {
            button3.Enabled = false;
            baglantim.Open();
            SqlCommand kayıtgetir = new SqlCommand("select distinct RandevuID,Hasta.HastaAdi,Hasta.HastaSoyadi,Hasta.HastaYas,Hasta.HastaCinsiyet,Hastalik.HastalikIsmi,Hastalik.HastalikID,Hasta.HastaID from Hasta,Hastane,Bölüm,Hastalik,Doktor,Randevu where Randevu.HastaID=Hasta.HastaID and Randevu.DoktorID=Doktor.DoktorID and Randevu.HastalikID=Hastalik.HastalikID and RandevuID='" + hangi_kayit + "'", baglantim);
            SqlDataReader kayıtoku = kayıtgetir.ExecuteReader();
            if (kayıtoku.Read()==true)
            {
                randevunolabel.Text = kayıtoku[0].ToString();
                hastaadlabel.Text = kayıtoku[1].ToString();
                hastasoyadlabel.Text = kayıtoku[2].ToString();
                hastayaslabel.Text = kayıtoku[3].ToString();
                if (kayıtoku[4].ToString() == "True")
                {
                    hastacinsiyetlabel.Text = "Bay";
                }
                else if(kayıtoku[4].ToString() == "False")
                {
                    hastacinsiyetlabel.Text ="Bayan";
                }                           
                hastaliklabel.Text = kayıtoku[5].ToString();
                hastalik_ID = Convert.ToInt32(kayıtoku[6].ToString());
                hasta_ID = Convert.ToInt32(kayıtoku[7].ToString());
            }
            kayıtoku.Close();

            label14.Text = hastaliklabel.Text;

            SqlCommand ilacgetir = new SqlCommand("select IlacIsmi from Ilac,Hastalik where Ilac.HastalikID=Hastalik.HastalikID and Hastalik.HastalikID='" + hastalik_ID + "'", baglantim);
            ilacgetir.Parameters.AddWithValue(hastalik_ID.ToString(), ilaccombobox.SelectedIndex + 1);
            SqlDataReader ilacoku = ilacgetir.ExecuteReader();
            while (ilacoku.Read())
            {
                ilaccombobox.Items.Add(ilacoku[0].ToString());
            }
            ilacoku.Close();
          
            baglantim.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            button3.Enabled = true;
            baglantim.Open();
            SqlCommand ilacyaz = new SqlCommand(" SiparisEkle @HastaID,@IlacID ", baglantim);
            ilacyaz.Parameters.Add("@HastaID", hasta_ID);
            ilacyaz.Parameters.Add("IlacID", ilac_ID);
            ilacyaz.ExecuteNonQuery();
            MessageBox.Show("İlaç kargoya verildi");
            baglantim.Close();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            baglantim.Open();
            ilac_Isim = ilaccombobox.Text;

            SqlCommand ilacIDal = new SqlCommand(" IlacIDal @IlacIsmi ", baglantim);
            ilacIDal.Parameters.Add("@IlacIsmi", ilac_Isim);
            ilac_ID = Convert.ToInt32(ilacIDal.ExecuteScalar().ToString());

            SqlCommand ilacFiyatal = new SqlCommand(" IlacFiyatAl @IlacIsmi ", baglantim);
            ilacFiyatal.Parameters.Add("@IlacIsmi", ilac_Isim);
            ilac_Fiyat = Convert.ToInt32(ilacFiyatal.ExecuteScalar().ToString());

            SqlCommand ilacStokal = new SqlCommand(" IlacStokAl @IlacIsmi ", baglantim);
            ilacStokal.Parameters.Add("IlacIsmi", ilac_Isim);
            ilac_Stok = Convert.ToInt32(ilacStokal.ExecuteScalar().ToString());

            label22.Text = ilac_ID.ToString();
            label20.Text = ilac_Fiyat.ToString();
            label18.Text = ilac_Stok.ToString();
            baglantim.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            baglantim.Open();
            SqlCommand randevuSil = new SqlCommand("RandevuSil @HangiKayit", baglantim);
            randevuSil.Parameters.Add("@HangiKayit", hangi_kayit);
            randevuSil.ExecuteNonQuery();
            MessageBox.Show("Randevu Silindi");
            baglantim.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            baglantim.Open();
            SqlCommand istifaet = new SqlCommand("Delete from Doktor where DoktorID='" + doktor_ID + "'", baglantim);
            istifaet.ExecuteNonQuery();
            MessageBox.Show("İstifa ettiniz");
            baglantim.Close();
        }
    }
}
