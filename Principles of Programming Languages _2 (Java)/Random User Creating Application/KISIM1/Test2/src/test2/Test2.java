/**
*
* @author Doğukan Dursun Furkan Tektaş dogukandursun55@hotmail.com
* @since 25.04.2020
* <p>
* rastgele kişi üretme
* </p>
*/
package test2;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import rastgelekisiuret.RastgeleKisi;


public class Test2 {

    
    public static void main(String[] args)  {
        
        
        String yazi="1- Rastgele Kişi Üret\n"+
                    "2- Üretilmiş Dosya Kontrol Et\n"+
                    "3- Çıkış";
        int kisi_sayisi;
        File file = new File("Kisiler.txt");
        FileOutputStream fos=null;
        BufferedWriter bw=null;
        FileInputStream fis=null;
        BufferedReader br=null;
        RastgeleKisi[] kisiler = null;
        
        
        while(true){
            Scanner scan=new Scanner(System.in);
            System.out.println(yazi);
            int secim=scan.nextInt();
            scan.nextLine();
            ArrayList<String> degerler=new ArrayList<>();
            boolean cikilacak_mi=false;
            switch(secim){                    
                    case 1:                        
                        System.out.println("Kaç adet Kişi üretmek istiyorsunuz..");
                        kisi_sayisi=scan.nextInt();
                        scan.nextLine();
                        
                        kisiler=new RastgeleKisi[kisi_sayisi];
                        
                        for (int i = 0; i < kisi_sayisi; i++) {   
                                                               
                                kisiler[i]=new RastgeleKisi();
                                degerler.add(kisiler[i].RastgeleKisi_Uret());
                         
                            }
                        
                        try {
                            fos = new FileOutputStream(file);
                            
                            bw = new BufferedWriter(new OutputStreamWriter(fos));
                                                        
                                
                            try {
                                for(int j=0;j<kisi_sayisi;j++){
                                
                                    bw.write(degerler.get(j));
                                    
                                    try {
                                    bw.newLine();
                                
                                    } catch (IOException ex) {
                                        System.out.println("Alt satıra geçilirken hata oluştu");
                                    }
                                
                                }
                                
                                
                            } catch (IOException ex) {
                                System.out.println("Dosyaya yazılırken hata oluştu");
                            }
                            
                        
                            
                        } catch (FileNotFoundException ex) {
                            System.out.println("Dosya bulunamadı");
                        }
                        try {
                            bw.close();
                        } catch (IOException ex) {
                            Logger.getLogger(Test2.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        finally{
                        try {
                                                               
                            if(fis!=null){
                                fis.close();
                            }
                            
                            } catch (IOException ex) {
                                System.out.println("HATA.");
                            }                       
                        }
                        break;
                        
                      
                    case 2: 
                        
                        String[] bilgiler=null;
                        int gecerli_Tc=0,gecersiz_Tc=0,gecerli_Imei=0,gecersiz_Imei=0;
                          try {
                                                    
                            fis=new FileInputStream("Kisiler.txt");
            
                            br=new BufferedReader(new InputStreamReader(fis));
            
                            String satir=br.readLine();
            
                            int a=0;
                            while(satir!=null ){
                                
                                bilgiler=satir.split(" ");
                                
                                for(int j=0;j<6;j++){
                                
                                    if(j==0){
                                        
                                        if(!kisiler[a].Tc_kontrol(bilgiler[j]))
                                            gecerli_Tc++;
                                        else
                                            gecersiz_Tc++;
                                                                       
                                    }
                                    else if(j==5){
                                        String imei=bilgiler[j].substring(1, 16);
                                        
                                        if(!kisiler[a].imei_Kontrol(imei))
                                            gecerli_Imei++;
                                        else
                                            gecersiz_Imei++;
                                    
                                    }
                                                                   
                                }
                                          
                                satir=br.readLine();
                                a++;
                                
                            }
                              System.out.println("T.C. Kimlik Kontrol");
                              System.out.println(gecerli_Tc+"  Geçerli");
                              System.out.println(gecersiz_Tc+"  Geçersiz");
                              
                              System.out.println("IMEI Kontrol");
                              System.out.println(gecerli_Imei+"  Geçerli");
                              System.out.println(gecersiz_Imei+"  Geçersiz");
                              
                              
                        } catch (FileNotFoundException ex) {
                            Logger.getLogger(Test2.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (IOException ex) {
                            Logger.getLogger(Test2.class.getName()).log(Level.SEVERE, null, ex);
                        } 
                          break;
                        
                    
                    case 3:
                        
                        System.out.println("Programan çıkılıyor..");
                        cikilacak_mi=true;
                        break;
                        
                        
                        
                        
                        
        
            }
            if(cikilacak_mi)
                break;
            else
                continue;
            
        }//while sonu
        
        
        
        
        
    }
    
}
