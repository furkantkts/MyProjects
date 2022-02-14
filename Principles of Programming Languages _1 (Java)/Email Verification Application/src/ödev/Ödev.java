/**
*
* @author Doğukan Dursun dogukan.dursun@ogr.sakarya.edu.tr
* @author Furkan Tektaş furkan.tektas@ogr.sakarya.edu.tr
* @since 3.3.2020

* <p>
*Txt Analiz Programı
* </p>
 
*/






package ödev;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Ödev {

    
    public static void main(String[] args) throws IOException {
        FileInputStream okuma=null;
        BufferedReader bfOkuma = null;        
        
        String[] degerler=null; 
        String[] AlanAdlari={".com.tr",".com",".net.tr",".net",".edu.tr",".edu",".org.tr",".org"};
        String[] AlanAdlariNoktasiz={"comtr","com","nettr","net","edutr","edu","orgtr","org"};
        int degerUzunluk=0;
        String noktasiz;
        
        int toplamSesliSayisi=0,toplamKelimeSayisi=0,toplamMailSayisi=0,toplamWebSayisi=0,toplamCumleSayisi=0;       
        try {
            okuma=new FileInputStream("icerik.txt"); // txt dosyamızı tanıttık
            bfOkuma = new BufferedReader(new InputStreamReader(okuma));    //input stream readerdaki ni buffered readere aktardık                                                        
                       
            String line = bfOkuma.readLine();
                while(line != null){//line boş değilse yani satır boş değilse işlemleri gerçekleştir
                    degerler=line.split(" ");  //kelimeleri ayırdık                                      
                for (int i=0;i<degerler.length;i++) {                                                              
                        if(degerler[i].endsWith(".")){//kelime noktayla bitiyorsa
                            noktasiz=degerler[i].replace(".", "");//noktayı noktasız haliyle değiştirip noktasıza atadık
                            for(String AlanAdlari2:AlanAdlariNoktasiz){//noktasız halleri
                                if (noktasiz.endsWith(AlanAdlari2)) {
                                    if(noktasiz.contains("@")){//noktasız dizisindeki eleman' @ ' içeriyorsa toplam mail
                                                               //sayisini 1 arttır
                                     toplamMailSayisi++;
                                    }                      
                                    else{
                                      toplamWebSayisi++;//değilse sonu alanadlarından biriyle bittigi için web sitesidir
                                                        //bu yüzden websayisi ni arttır
                                    }                               
                                }     
                            }                                                 
                        }                        
                        else {
                            for(String AlanAdlari2:AlanAdlari)//noktalı (normal) hali
                                if(degerler[i].endsWith(AlanAdlari2))
                                    if(degerler[i].contains("@")){
                                      toplamMailSayisi++;//@ varsa maili arttır
                                     }                      
                                     else{
                                       toplamWebSayisi++;//değilse websayisini arttir
                                    }                                                      
                        }
                     
                    char[] harflereBolunmus=degerler[i].toCharArray();
                    for(char harfler:harflereBolunmus){                                          
                        if(harfler=='a'||harfler=='A'||harfler=='e'||harfler=='E'||harfler=='ı'||harfler=='I'||harfler=='i'||harfler=='İ'||harfler=='o'||harfler=='O'||harfler=='ö'||harfler=='Ö'||harfler=='u'||harfler=='U'||harfler=='ü'||harfler=='Ü'){
                            toplamSesliSayisi++;
                        }                                              
                    }                                          
                        toplamKelimeSayisi++;
                }                   
                           line=bfOkuma.readLine(); 

                }
                toplamCumleSayisi = CumleSayisiBul(degerler);
                System.out.println("Toplam sesli sayısı: "+toplamSesliSayisi);//verilerin ekrana yazdırılması
                System.out.println("Toplam kelime sayısı: "+toplamKelimeSayisi);
                System.out.println("Toplam mail sayısı: "+toplamMailSayisi);
                System.out.println("Toplam web sayısı: "+toplamWebSayisi);
                System.out.println("Toplam cumle sayısı: "+toplamCumleSayisi);
                
                                         
        } catch (FileNotFoundException ex) {//dosya bulunamadı hatası
            System.out.println("AMK hatası geldi.");
        }
        finally{
            try {
                if(okuma!=null){
                    System.out.println(" ");
                    okuma.close();
                }
            } catch (IOException ex) {
                System.out.println(" ");
            }
        }       
    }
    
    
    public static int CumleSayisiBul(String[] degerler) throws IOException{
        int cumleSayi = 0;
        FileInputStream okumaCumle=null;
        BufferedReader bfOkumaCumle = null;  
        try { 
            okumaCumle=new FileInputStream("icerik.txt"); //icerik txtyi tanıttık
            bfOkumaCumle = new BufferedReader(new InputStreamReader(okumaCumle));       
            String line=bfOkumaCumle.readLine();
            while(line != null){//satır boş değilse
                    degerler=line.split(" ");   //kelimelere ayır                                     
                for (String tumDegerler : degerler) {                                                                                                                                   
                        if(tumDegerler.endsWith(".")){//noktayla biten her kelime oldugunda cumlesayisini 1 arttır
                            cumleSayi++;
                        }                                                                                                                      
                }                   
                           line=bfOkumaCumle.readLine(); 
                }
                       
        } catch (FileNotFoundException ex) {//hata
            Logger.getLogger(Ödev.class.getName()).log(Level.SEVERE, null, ex);
        }
         return cumleSayi;
    }
      
}
