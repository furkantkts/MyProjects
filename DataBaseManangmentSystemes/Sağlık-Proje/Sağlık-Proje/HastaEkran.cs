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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Data;

namespace Sağlık_Proje
{
    public partial class HastaEkran : Form
    {
        static public int kayıt_sayisi;
        static public int hangi_kayit;
        static public int randevu_id;
        static public int hasta_id;
        static public string hasta_adi;
        static public string hasta_soyadi;
        static public string hastane_adi;
        static public string bolum_adi;
        static public string doktor_adi;
        static public string hastalik_adi;
        static public int hastane_id;
        static public int bolum_id;
        static public int doktor_id;
        static public int hastalik_id;
        
        public HastaEkran()
        {
            InitializeComponent();
        }
        SqlConnection baglantim = new SqlConnection("Data Source=DESKTOP-VFNVPU7\\SQLEXPRESS;Initial Catalog=Eczane;Integrated Security=True");
        public void hastaneYaz()
        {
            comboBox1.Items.Add("Sisli");
            comboBox1.Items.Add("Eyüp");                
            comboBox1.Items.Add("Arnavutköy");
            comboBox1.Items.Add("Sariyer");
            comboBox1.Items.Add("Üsküdar");       
        }
        private void HastaEkran_Load(object sender, EventArgs e)
        {
            hastaneYaz();
            baglantim.Open();
            SqlCommand hastagetir = new SqlCommand("select *from Hasta where HastaID='" + hasta_id + "'", baglantim);
            SqlDataReader okuhasta = hastagetir.ExecuteReader();
            if (okuhasta.Read() == true)
            {
                label1.Text = "SAYIN  " + okuhasta[1]+" " + okuhasta[2] + "  SAĞLIK SİSTEMİMİZE HOŞGELDİNİZ";
                hasta_id = Convert.ToInt32(okuhasta[0].ToString());
                hasta_adi = okuhasta[1].ToString();
                hasta_soyadi = okuhasta[2].ToString();
                isimtextbox.Text = okuhasta[1].ToString();
                soyisimtextbox.Text = okuhasta[2].ToString();
            }
            okuhasta.Close();
            SqlCommand kayıtsırala = new SqlCommand(" KayitSiralaHasta @HastaID ", baglantim);
            kayıtsırala.Parameters.Add("@HastaID", hasta_id);
            kayıtsırala.Parameters.AddWithValue(hasta_id.ToString(), comboBox5.SelectedIndex + 1);
            SqlDataReader getir = kayıtsırala.ExecuteReader();
            while (getir.Read())
            {
                comboBox5.Items.Add(getir[0].ToString());
            }
            getir.Close();
            SqlCommand kackayitvar = new SqlCommand(" KacKayitVar @HastaID ", baglantim);
            kackayitvar.Parameters.Add("@HastaID", hasta_id);
            kayıt_sayisi = Convert.ToInt32(kackayitvar.ExecuteScalar().ToString());
            label17.Text = kayıt_sayisi + " adet randevunuz bulunmaktadır";
            baglantim.Close();         
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            baglantim.Open();
            if (comboBox1.SelectedIndex == -1 || comboBox2.SelectedIndex == -1 || comboBox4.SelectedIndex == -1 || comboBox3.SelectedIndex == -1)
            {
                MessageBox.Show("Lütfen eksik bilgi girmeyiniz");
                baglantim.Close();
            }
            else
            {
                SqlCommand randevual = new SqlCommand("RandevuEkle @HastaID,@DoktorID,@HastaneID,@BolumID,@HastalikID", baglantim);
                randevual.Parameters.Add("@HastaID", hasta_id);
                randevual.Parameters.Add("@DoktorID", doktor_id);
                randevual.Parameters.Add("@HastaneID", hastane_id);
                randevual.Parameters.Add("@BolumID", bolum_id);
                randevual.Parameters.Add("@HastalikID", hastalik_id);
                randevual.ExecuteNonQuery();
                MessageBox.Show("Randevunuz " + hasta_adi + " " + doktor_adi + " " + hastane_adi + " " + bolum_adi + " " + hastalik_adi + " " + " Başarıyla Oluşturuldu");
                baglantim.Close();
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            baglantim.Open();
            hastane_adi = comboBox1.Text;          
            SqlCommand hastanenobul = new SqlCommand("select HastaneID from Hastane where HastaneAdi='" + hastane_adi + "' ", baglantim);
            hastane_id = Convert.ToInt32(hastanenobul.ExecuteScalar().ToString());
            SqlCommand bolumlerigetir = new SqlCommand("select BolumIsmi from Hastane_Bölüm,Bölüm where Hastane_Bölüm.HastaneID='" + hastane_id + "'and Hastane_Bölüm.BolumID=Bölüm.BolumID ", baglantim);
            bolumlerigetir.Parameters.AddWithValue(hastane_id.ToString(), comboBox1.SelectedIndex + 1);
            SqlDataReader oku1 = bolumlerigetir.ExecuteReader();
            while (oku1.Read())
            {
                comboBox2.Items.Add(oku1[0]);
            }
            oku1.Close();
            baglantim.Close();                              
        }
        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            baglantim.Open();
            bolum_adi = comboBox2.Text;
            SqlCommand bolumnobul = new SqlCommand("select BolumID from Bölüm where BolumIsmi='" + bolum_adi + "'", baglantim);
            bolum_id = Convert.ToInt32(bolumnobul.ExecuteScalar().ToString());
            SqlCommand doktorlarigetir = new SqlCommand("select distinct  Doktor.DoktorAdi   from Doktor,Hastane,Hastane_Doktor,Hastane_Bölüm,Bölüm where Hastane_Doktor.DoktorID=Doktor.DoktorID and Hastane_Doktor.HastaneID=Hastane.HastaneID and  Hastane_Doktor.DoktorID=Doktor.DoktorID and Hastane_Bölüm.BolumID=Bölüm.BolumID and Doktor.BolumID=Bölüm.BolumID and Hastane.HastaneID='"+hastane_id+"' and Hastane_Bölüm.BolumID='"+bolum_id+"'", baglantim);
            doktorlarigetir.Parameters.AddWithValue(bolum_id.ToString(), comboBox2.SelectedIndex + 1);
            SqlDataReader oku2 = doktorlarigetir.ExecuteReader();
            while (oku2.Read())
            {
                comboBox3.Items.Add(oku2[0]);
            }
            oku2.Close();
            SqlCommand hastalikgetir = new SqlCommand("select HastalikIsmi from Hastalik where Hastalik.BolumID='" + bolum_id + "'", baglantim);
            hastalikgetir.Parameters.AddWithValue(bolum_id.ToString(), comboBox2.SelectedIndex + 1);
            SqlDataReader oku3 = hastalikgetir.ExecuteReader();
            while (oku3.Read())
            {
                comboBox4.Items.Add(oku3[0]);
            }
            oku3.Close();
            baglantim.Close();
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            baglantim.Open();
            doktor_adi = comboBox3.Text;
            SqlCommand doktornobul = new SqlCommand(" DoktorNoBul @DoktorAdi ", baglantim);
            doktornobul.Parameters.Add("@DoktorAdi", doktor_adi);
            doktor_id = Convert.ToInt32(doktornobul.ExecuteScalar().ToString());
            baglantim.Close();
        }
        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            baglantim.Open();
            hastalik_adi = comboBox4.Text;
            SqlCommand hastaliknobul = new SqlCommand("select HastalikID from Hastalik where HastalikIsmi='" + hastalik_adi + "'", baglantim);
            hastalik_id= Convert.ToInt32(hastaliknobul.ExecuteScalar().ToString());
            baglantim.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {        
            baglantim.Open();            
            SqlCommand sorgula = new SqlCommand("select RandevuID,Hasta.HastaAdi,Hasta.HastaSoyadi,Hastane.HastaneAdi,Bölüm.BolumIsmi,Hastalik.HastalikIsmi,Doktor.DoktorAdi from Hasta,Hastane,Bölüm,Hastalik,Doktor,Randevu where Randevu.HastaID=Hasta.HastaID and Randevu.DoktorID=Doktor.DoktorID and Randevu.HastalikID=Hastalik.HastalikID and Randevu.BolumID=Bölüm.BolumID and Randevu.HastaneID=Hastane.HastaneID and RandevuID='"+hangi_kayit+"'", baglantim);
            SqlDataReader okusorgu = sorgula.ExecuteReader();
            if (okusorgu.Read() == true)
            {
                textBox1.Text = okusorgu[0].ToString();
                textBox2.Text = okusorgu[1].ToString();
                textBox3.Text = okusorgu[2].ToString();
                textBox4.Text = okusorgu[3].ToString()+" Hastanesi";
                textBox5.Text = okusorgu[4].ToString();
                textBox6.Text = okusorgu[5].ToString();
                textBox7.Text = okusorgu[6].ToString()+" Bey";
            }
            okusorgu.Close();
            baglantim.Close();
        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {
            baglantim.Open();
            hangi_kayit = Convert.ToInt32(comboBox5.Text);
            baglantim.Close();    
        }
    }
}
