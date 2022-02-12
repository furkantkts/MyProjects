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
**              DERSİN ALINDIĞI GRUP...:1-B
****************************************************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace futbol
{
    class Program
    {
        static void Main(string[] args)
        {
           //futbolcular oluşturuldu ve listeye atandı..//
            var futbolcular = new List<Futbolcu>();
            futbolcular.Add(new Defans("Ramos", 5));
            futbolcular.Add(new Defans("Van Djik", 4));
            futbolcular.Add(new Defans("Marcao", 3));
            futbolcular.Add(new Defans("Pique", 2));
            futbolcular.Add(new Ortasaha("Pogba", 8));
            futbolcular.Add(new Ortasaha("Kante", 6));
            futbolcular.Add(new Ortasaha("Kross",1 ));
            futbolcular.Add(new Ortasaha("Ozil", 9));
            futbolcular.Add(new Forvet("Suarez", 8));
            futbolcular.Add(new Forvet("Salah", 7));

            
            Boolean gololabilir;/*boolean değer ile kontrol döngüleri yapılarak gol için
            oluşturulan ana döngüye geçip geçemediği kontrol edildi*/
            for (int i = 1; i < 2; i++)//gol için oluşturulan ve sadece 1 kere dönen ana döngü//
            {
                for (int j = 1; j <= 3; j++)//pas için kurulan döngü//
                {

                    double passkor = 60.0;//pas başarı sınırı atandı//
                    Random rnd = new Random();//her seferinde rastgele değerler atandı//
                    int pasNo = rnd.Next(0, 10);//her seferinde rastgele değerler atandı//                  

                    futbolcular[pasNo].Pasver();//metod ile pas başarı yüzdesi otomatik atandı//

                    gololabilir = futbolcular[pasNo].PasSkor > passkor;//boolean ile 60'tan büyükse true değilse false atandı//

                    if (gololabilir == false)//pas başarısız ise//
                    {
                        Console.WriteLine(futbolcular[pasNo].ADSOYAD + " pası atamadı atak sonlanıyor..");
                        goto GİT;//döngü sonuna gidildi ve program kapandı//
                    }

                    else//pas başarılı ise//
                    {
                        Console.WriteLine(futbolcular[pasNo].ADSOYAD + " attı pası atak devam ediyor..");
                        futbolcular.RemoveAt(pasNo);//pası atan oyuncu listeden çıkartıldı ve kendine pas atması önlenmiş oldu//
                    }
                }
                Random rnd1 = new Random();//her seferinde rastgele değerler atandı//
                int golNo = rnd1.Next(0, 10);//her seferinde rastgele değerler atandı//

                futbolcular[golNo].GolVurusu();//metod ile gol başarı yüzdesi otomatik atandı//

                if (futbolcular[golNo].GolSkor > 70.0)//gol başarı yüzdesi 70'ten büyükse yani başarılı ise//
                {
                    Console.WriteLine(futbolcular[golNo].ADSOYAD + " şutu çekti vee GOOOOOOLL..");//ekrana bunu yaz//
                }

                else
                    Console.WriteLine(futbolcular[golNo].ADSOYAD + " vurduuuuuuu ahhh dağlara taşlara");//değilse bunu yaz//
            }
            GİT://pasların herhangi biri bile başarısız olsa tüm döngülerden çıkılır ve program kapanır//

            Console.ReadKey();
        }
    }
}
