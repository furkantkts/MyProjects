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
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Media;

namespace çiftlikbank
{
    public partial class PaneliGuncelleForm : Form
    {
        public PaneliGuncelleForm()
        {
            InitializeComponent();
        }
        Tavuk tavuk = new Tavuk();
        Ordek ordek = new Ordek();
        Inek inek = new Inek();
        Keci keci = new Keci();      
        int kasa = 0;
        int sayac = 0;
        private void PaneliGuncelleForm_Load(object sender, EventArgs e)
        {
            timer1.Start();
            timer2.Start();
            timer3.Start();
            timer4.Start();
            timer5.Start();
            timer6.Start();
            timer7.Start();
            timer8.Start();
        }
        private void GostergePaneliniGuncelle()
        {
            TavukCanProgressBar.Value = tavuk.Can;
            if (tavuk.Can == 0)
            {
                TavukCanProgressBar.Enabled = false;
                timer1.Stop();
                tavuk.sesAta();
                timer2.Stop();
                CanTavukLabel.Text = "ÖLDÜ";
            }
            else
                TavukCanProgressBar.Value = tavuk.Can;

            OrdekCanProgressBar.Value = ordek.Can;
            if (ordek.Can == 1)
            {
                OrdekCanProgressBar.Value = 0;
                OrdekCanProgressBar.Enabled = false;
                timer3.Stop();
                ordek.sesAta();
                timer4.Stop();
                CanOrdekLabel.Text = "ÖLDÜ";
            }
            else
                OrdekCanProgressBar.Value = ordek.Can;

            KeciCanProgressBar.Value = keci.Can;
            if (keci.Can == 4)
            {
                KeciCanProgressBar.Value = 0;
                KeciCanProgressBar.Enabled = false;
                timer5.Stop();
                keci.sesAta();
                timer6.Stop();
                KeciCanLabel.Text = "ÖLDÜ";
            }
            else
                KeciCanProgressBar.Value = keci.Can;

            InekCanProgressBar.Value = inek.Can;
            if (inek.Can == 4)
            {
                InekCanProgressBar.Value = 0;
                InekCanProgressBar.Enabled = false;
                timer7.Stop();
                inek.sesAta();
                timer8.Stop();
                InekCanLabel.Text = "ÖLDÜ";
            }
            else
                InekCanProgressBar.Value = inek.Can;

            label6.Text = kasa.ToString() + " TL";
        }
        private void timer1_Tick(object sender, EventArgs e)
        {
            tavuk.CanAzalt();           
            GostergePaneliniGuncelle();
            sayac++;
            label4.Text = sayac.ToString() + " SN";
        }
        private void timer2_Tick(object sender, EventArgs e)
        {
            tavuk.UrunArttir();
            TavukYumurtaArttirLabel.Text = tavuk.UrunSayi.ToString() + " ADET";
        }
        private void timer3_Tick(object sender, EventArgs e)
        {
            ordek.CanAzalt();
            GostergePaneliniGuncelle();
        }
        private void timer4_Tick(object sender, EventArgs e)
        {
            ordek.UrunArttir();
            OrdekYumurtaArttirLabel.Text = ordek.UrunSayi.ToString() + " ADET";
        }
        private void timer5_Tick(object sender, EventArgs e)
        {
            keci.CanAzalt();
            GostergePaneliniGuncelle();
        }
        private void timer6_Tick(object sender, EventArgs e)
        {
            keci.UrunArttir();
            KeciSutArttirLabel.Text = keci.UrunSayi.ToString() + " LİTRE";
        }
        private void timer7_Tick(object sender, EventArgs e)
        {
            inek.CanAzalt();
            GostergePaneliniGuncelle();
        }
        private void timer8_Tick(object sender, EventArgs e)
        {
            inek.UrunArttir();
            İnekSutArttirLabel.Text = inek.UrunSayi.ToString() + " LİTRE";
        }    
        private void YemVerTavukButton_Click(object sender, EventArgs e)
        {
            if (TavukCanProgressBar.Value == 0)
                tavuk.Can = 0;
            else
                tavuk.Can = 100;
            GostergePaneliniGuncelle();
        }
        private void YemVerInekButton_Click(object sender, EventArgs e)
        {
            if (InekCanProgressBar.Value == 0)
                inek.Can = 0;
            else
                inek.Can = 100;
            GostergePaneliniGuncelle();
        }

        private void YemVerOrdekButton_Click(object sender, EventArgs e)
        {
            if (OrdekCanProgressBar.Value == 0)
                ordek.Can = 0;
            else
                ordek.Can = 100;
            GostergePaneliniGuncelle();
        }

        private void YemVerKeciButton_Click(object sender, EventArgs e)
        {
            if (KeciCanProgressBar.Value == 0)
                keci.Can = 0;
            else
                keci.Can = 100;
            GostergePaneliniGuncelle();
        }
        private void TavukYumurtasiSatButton_Click(object sender, EventArgs e)
        {
            int tavukYumurtaAdet = tavuk.UrunSayi;
            kasa += 1 * tavukYumurtaAdet;
            tavuk.UrunSayi = 0;
            if (TavukCanProgressBar.Value == 0)
                TavukYumurtaArttirLabel.Text = tavuk.UrunSayi.ToString() + " ADET";
        }
        private void İnekSutuSatButton_Click(object sender, EventArgs e)
        {
            int inekSutMiktar = inek.UrunSayi;
            kasa += 5 * inekSutMiktar;
            inek.UrunSayi = 0;
            if (InekCanProgressBar.Value == 0)      
                İnekSutArttirLabel.Text = inek.UrunSayi.ToString() + " LİTRE";             
        }
        private void OrdekYumurtasiSatButton_Click(object sender, EventArgs e)
        {
            int ordekYumurtaAdet = ordek.UrunSayi;
            kasa += 3 * ordekYumurtaAdet;
            ordek.UrunSayi = 0;
            if (OrdekCanProgressBar.Value == 0)
                OrdekYumurtaArttirLabel.Text = ordek.UrunSayi.ToString() + " ADET";
        }
        private void KeciSutuSatButton_Click(object sender, EventArgs e)
        {
            int keciSutMiktar = keci.UrunSayi;
            kasa += 8 * keciSutMiktar;
            keci.UrunSayi = 0;
            if (KeciCanProgressBar.Value == 0)
                KeciSutArttirLabel.Text = keci.UrunSayi.ToString() + " LİTRE";
        }
    }
}
