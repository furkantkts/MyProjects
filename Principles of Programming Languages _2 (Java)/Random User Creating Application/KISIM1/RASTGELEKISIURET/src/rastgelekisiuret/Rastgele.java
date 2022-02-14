/**
*
* @author Doğukan Dursun Furkan Tektaş dogukandursun55@hotmail.com
* @since 25.04.2020
* <p>
* rastgele kişi üretme
* </p>
*/
package rastgelekisiuret;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Rastgele {
    
    private long rastgeleSayi_Long;
    private int rastgeleSayi_Int;
    private ArrayList<String> isimler;
    

    public Rastgele() {
        this.rastgeleSayi_Long = 0;
        this.rastgeleSayi_Int = 0;
    }
    
        
    public int rastgeleRakamUret(){
        
        rastgeleSayi_Long=System.currentTimeMillis();//rastgele sayı üretiyoruz
        
        rastgeleSayi_Int=(int) rastgeleSayi_Long%10;//ürettigimiz sayıyının mod10 unu alıp max 9 olması için
                
        try {
            Thread.sleep(5);
        } catch (InterruptedException ex) {
            Logger.getLogger(Rastgele.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(rastgeleSayi_Int<0)//sayi negatifse pozitife çeviriyoruz
            rastgeleSayi_Int*=-1;
        
        return rastgeleSayi_Int;
    
    }
    public int rastgeleYasUret(){
        
        rastgeleSayi_Long=System.currentTimeMillis();
        
        rastgeleSayi_Int=(int) rastgeleSayi_Long%100;//yaş max 100 olması için
                
        try {
            Thread.sleep(5);
        } catch (InterruptedException ex) {
            Logger.getLogger(Rastgele.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(rastgeleSayi_Int<0)//negatifse pozitif yapıyoruz
            rastgeleSayi_Int*=-1;
        
        return rastgeleSayi_Int;
    
    }
    
    public String rastgeleIsimUret() {
        isimler=new ArrayList<>();
        FileInputStream fis;
        BufferedReader bufferedreader;
        int hangiSatir=0;
        String isim_soyisim;
                    
        try {
                       
            fis=new FileInputStream("random_isimler.txt");//dosyayı açıyoruz
            
            bufferedreader=new BufferedReader(new InputStreamReader(fis));
            
            String satir=bufferedreader.readLine();//satir değişkenine dosyadaki satırı atıyoruz
            
            while(satir!=null){//satır boş değilse

                isimler.add(satir);//satir değişkenininn değerlerini isimlere ekliyoruz
                
                satir=bufferedreader.readLine();
            }
        } catch (FileNotFoundException ex) {//dosya bulunamadı hatası
            Logger.getLogger(Rastgele.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Rastgele.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        hangiSatir=(int) System.currentTimeMillis()% 3000;//hangi satır değişkenini max 2999 olacak şekilde ayarlıyoruz
        
        if(hangiSatir<0)//hangisatir değişkeni negatifse pozitife çeviriyoruz
            hangiSatir*=-1;
        
        isim_soyisim=isimler.get(hangiSatir);//isim soyisim değişkenine rastgele üretilen hangi satır sayısı sıra nolu isimler arrayındaki değişken atanır.
       
        return isim_soyisim;
    }
    
    
}
