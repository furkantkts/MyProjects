/**
*
* @author Doğukan Dursun Furkan Tektaş dogukandursun55@hotmail.com
* @since 25.04.2020
* <p>
* rastgele kişi üretme
* </p>
*/
package rastgelekisiuret;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class KimlikNo {
    
    private int tekHanelerToplam,ciftHanelerToplam,onuncuHane,onBirinciHane;
    
    private int gecici_sayi=0;
    
    private String tcKimlikNo="";
    
    private final Rastgele rastgele=new Rastgele();
    
    private final int[] ilkHaneRastgele={1,2,3,4,5,6,7,8,9};
    
    private final ArrayList<Integer> tc_List=new ArrayList<>();
    

    public KimlikNo() {
        tcKimlikNo=TcKimlik_Olustur();
    }
    
    public String getTC(){
    
        return tcKimlikNo;
    }
    
    
    public String TcKimlik_Olustur(){
           
        gecici_sayi=0;
        
        for(int i=0;i<11;i++){
            
            gecici_sayi=rastgele.rastgeleRakamUret();//rastgele rakam ürettik
            
            if(gecici_sayi==0 && i==0){//ilk hane..0 olamama durumu
               
                int ilkhane=rastgele.rastgeleRakamUret();
                               
                gecici_sayi=ilkHaneRastgele[ilkhane];
                
                                        
            }
            
            else if(i==9){//onuncu hane..
                
                tekHanelerToplam=tc_List.get(0)+tc_List.get(2)+tc_List.get(4)+tc_List.get(6)+tc_List.get(8);
                
                ciftHanelerToplam=tc_List.get(1)+tc_List.get(3)+tc_List.get(5)+tc_List.get(7);
                
                onuncuHane=((7*tekHanelerToplam)-ciftHanelerToplam)%10;
                
                gecici_sayi=onuncuHane;
                
            }
            
            else if(i==10){//onbirinci hane..
            
                onBirinciHane=(ciftHanelerToplam+tekHanelerToplam+onuncuHane)%10;
                //11. hane yi bulduk
                
                gecici_sayi=onBirinciHane;
                           
            }
            tc_List.add(gecici_sayi);
            
            try {
                Thread.sleep(5);
            } catch (InterruptedException ex) {
                Logger.getLogger(KimlikNo.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
    
        for(int j=0;j<11;j++){
            
            tcKimlikNo+=String.valueOf(tc_List.get(j));
                   
        }
                        
        return tcKimlikNo;
    
    }
    
    
    
    public boolean tcKimlik_Kontrol(String tckimlik){
        
        char rakamlar;
                   
        boolean gecerli_Mi=false;
        
        for(int i=0;i<tckimlik.length();i++){
        
            rakamlar=tckimlik.charAt(i);
                                    
            if(i==0 ){
              
                if(rakamlar=='0'){// 0 ile başlama durumu ..
                
                    gecerli_Mi=true;
                                              
                    System.out.println("Geçersiz kimlik,0 ile başlamaz");
                
                    break;
                                  
                }
         
            }
            
            else if(i==9 ){
                           
                String onuncuHane_String=String.valueOf(onuncuHane);
                
                char onuncuHane_char=onuncuHane_String.charAt(0);
                
                if(rakamlar!=onuncuHane_char){
                
                    gecerli_Mi=true;
                                               
                    System.out.println("Onuncu hane: "+rakamlar+" != "+onuncuHane+" -----> Geçersiz Kimlik");
                    
                    break;
                
                }
                          
            }
                        
            else if(i==10 ){
                            
                String onbirinciHane_String=String.valueOf(onBirinciHane);
                
                char onbirinciHane_char=onbirinciHane_String.charAt(0);
                
                if(rakamlar!=onbirinciHane_char){
                
                    gecerli_Mi=true;
                                               
                    System.out.println("Onbirinci hane: "+rakamlar+" != "+onBirinciHane+" -----> Geçersiz Kimlik");
                    
                    break;
                
                }
                          
            }
      
        }
            
        if(gecerli_Mi)
            return false;
        else
            return true;
        
    }
    
}
