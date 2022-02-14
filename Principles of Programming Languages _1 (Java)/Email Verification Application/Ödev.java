package ödev;

import com.sun.xml.internal.stream.buffer.stax.StreamReaderBufferCreator;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Ödev {

    
    public static void main(String[] args) throws IOException {
        FileInputStream okuma=null;
        BufferedReader bfOkuma = null;        
        
        String[] degerler=null; 
        String[] AlanAdlari={".com.tr",".com",".net.tr",".net",".edu.tr",".edu",".org.tr",".org"};
        String[] AlanAdlariNoktasiz={"comtr","com","nettr","net","edutr","edu","org.tr","org"};
        int degerUzunluk=0;
        String noktasiz;
        
        int toplamSesliSayisi=0,toplamKelimeSayisi=0,toplamMailSayisi=0,toplamWebSayisi=0,toplamCumleSayisi=0;       
        try {
            okuma=new FileInputStream("icerik.txt"); 
            bfOkuma = new BufferedReader(new InputStreamReader(okuma));                                                            
                       
            String line = bfOkuma.readLine(); 
                while(line != null){
                    degerler=line.split(" ");                                        
                for (int i=0;i<degerler.length;i++) {                                                              
                        if(degerler[i].endsWith(".")){
                            noktasiz=degerler[i].replace(".", "");
                            for(String AlanAdlari2:AlanAdlariNoktasiz){
                                if (noktasiz.endsWith(AlanAdlari2)) {
                                    if(noktasiz.contains("@")){
                                     toplamMailSayisi++;
                                    }                      
                                    else{
                                      toplamWebSayisi++;
                                    }                               
                                }     
                            }                                                 
                        }                        
                        else {
                            for(String AlanAdlari2:AlanAdlari)
                                if(degerler[i].endsWith(AlanAdlari2))
                                    if(degerler[i].contains("@")){
                                      toplamMailSayisi++;
                                     }                      
                                     else{
                                       toplamWebSayisi++;
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
                System.out.println("Toplam sesli sayısı: "+toplamSesliSayisi);
                System.out.println("Toplam kelime sayısı: "+toplamKelimeSayisi);
                System.out.println("Toplam mail sayısı: "+toplamMailSayisi);
                System.out.println("Toplam web sayısı: "+toplamWebSayisi);
                System.out.println("Toplam cumle sayısı: "+toplamCumleSayisi);
                
                                         
        } catch (FileNotFoundException ex) {
            System.out.println("AMK hatası geldi.");
        }
        finally{
            try {
                if(okuma!=null){
                    System.out.println("ANA SİKİCEM ŞİMDİ");
                    okuma.close();
                }
            } catch (IOException ex) {
                System.out.println("AMK HATASI GELECEK.");
            }
        }       
    }
    
    
    public static int CumleSayisiBul(String[] degerler) throws IOException{
        int cumleSayi = 0;
        FileInputStream okumaCumle=null;
        BufferedReader bfOkumaCumle = null;  
        try { 
            okumaCumle=new FileInputStream("icerik.txt"); 
            bfOkumaCumle = new BufferedReader(new InputStreamReader(okumaCumle));       
            String line=bfOkumaCumle.readLine();
            while(line != null){
                    degerler=line.split(" ");                                        
                for (String tumDegerler : degerler) {                                                                                                                                   
                        if(tumDegerler.endsWith(".")){
                            cumleSayi++;
                        }                                                                                                                      
                }                   
                           line=bfOkumaCumle.readLine(); 
                }
                       
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Ödev.class.getName()).log(Level.SEVERE, null, ex);
        }
         return cumleSayi;
    }
      
}
