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
    public partial class KaydolEkran : Form
    {
        public KaydolEkran()
        {
            InitializeComponent();
        }
        SqlConnection baglantim = new SqlConnection("Data Source=DESKTOP-VFNVPU7\\SQLEXPRESS;Initial Catalog=Eczane;Integrated Security=True");
        public string cinsiyet;
        public static int adres_ID;

        private void KaydolEkran_Load(object sender, EventArgs e)
        {
        }
       
        private void button1_Click(object sender, EventArgs e)
        {
         baglantim.Open();

          
            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox5.Text == "" || textBox6.Text == "" || (radioButton1.Checked==false &&radioButton2.Checked==false) || textBox7.Text=="" || textBox8.Text=="" ||textBox4.Text=="" )
            {
                MessageBox.Show("Lütfen bilgilerinizi eksiksiz girin");
                baglantim.Close();
            }
            else
            {
                SqlCommand AdresiEkle = new SqlCommand("Insert into AdresHasta values('" + textBox7.Text + "','" + textBox8.Text + "','" + textBox4.Text + "')", baglantim);
                AdresiEkle.ExecuteNonQuery();

                SqlCommand adresIDal = new SqlCommand("select ADRESID  from AdresHasta where ADRESID=SCOPE_IDENTITY()", baglantim);
                adres_ID = Convert.ToInt32(adresIDal.ExecuteScalar().ToString());

                if (radioButton1.Checked)
                {
                    cinsiyet = "True";
                }
                else if (radioButton2.Checked)
                {
                    cinsiyet = "False";
                }
                SqlCommand kaydet = new SqlCommand("Insert into Hasta values('" + textBox1.Text + "','" + textBox2.Text + "','" + textBox3.Text + "','" + cinsiyet + "','" +textBox6.Text+ "','" + textBox5.Text + "','"+adres_ID+"')", baglantim);
                kaydet.ExecuteNonQuery();
                MessageBox.Show("Kaydınız Tamamlandı");
                baglantim.Close();
            }
        }
    }
}
