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


public class IMEINo {
       
    private final Rastgele rastgele=new Rastgele();

    public IMEINo() {
    }

    public String imeiNo_olustur(){
        String imeiNoString="";
        
        ArrayList<Integer> imei=new ArrayList<>();
    
        ArrayList<Integer> imei_rastgele_carpilmis=new ArrayList<>();
    
        String dokuzdanBuyuk;
        
        int gecici_sayi,gecici,dokuzdanBuyuk_toplam,onBesinciIndex;

        for(int i=0;i<14;i++){
            gecici_sayi=rastgele.rastgeleRakamUret();//14 tane rastgele rakam üretilip imei arraylistine atandı
        
            imei.add(gecici_sayi);
                    
        }
        
        for(int i=0;i<14;i++){
            
            gecici=imei.get(i);
            
            if(i==1 || i==3 || i==5 || i==7 || i==9 || i==11 || i==13){//imei nin 2. 4. 6. 8. 10. 12. 14. hanelerini 2yle çarptık
            
                gecici=2*imei.get(i);
                
                if(gecici>9){//hanedeki değer 9 dan büyükse
                
                    dokuzdanBuyuk=String.valueOf(gecici);//sayıyı stringe çevirdik
                    
                    String ilkIndex=String.valueOf(dokuzdanBuyuk.charAt(0));//2 haneli sayının 1.hanesini ilk indexe atadık
                    
                    String ikinciIndex=String.valueOf(dokuzdanBuyuk.charAt(1));//2. hanesini 2. indexe atadık
                    
                    dokuzdanBuyuk_toplam=Integer.parseInt(ilkIndex)+Integer.parseInt(ikinciIndex);//2 haneyi topluyoruz 
                
                    gecici=dokuzdanBuyuk_toplam;//geçiciye 2 hanenin toplamını atıyoruz
                
                }
             
            }
            
            imei_rastgele_carpilmis.add(gecici);//imei_rastgele çarpılmış arraylistine gecicinin değerini aktarıyoruz
                
        }
        
        int toplam=0;
        
        toplam = imei_rastgele_carpilmis.stream().map((sayilar) -> sayilar).reduce(toplam, Integer::sum);
        
        onBesinciIndex=(toplam*9)%10;//toplam değerinin 9 la çarpıp 10ile bölümünden kalan değer 15. index oluyor
        
        imei.add(onBesinciIndex);//15. indexi de imei arraylistine ekledik
        
        
        for(int i=0;i<15;i++)
            imeiNoString+=String.valueOf(imei.get(i));//tüm haneleri birleştirdik ve imeino yu oluşturduk
           
        return imeiNoString; 
    
    }
    
    public boolean imeiKontrol_et(String imeiNo){
        
        ArrayList<Integer> imeiList=new ArrayList<>();
        
        String ilkHane,ikinciHane,rakamString;
                
        int dokuzbuyukTopla,rakamint,listTopla = 0,onbes;
        
        char rakamChar;
        
        for(int i=0;i<imeiNo.length()-1;i++){//imeinonun son hanesi hariç diğer hanelerini
        
            rakamChar=imeiNo.charAt(i);//rakamchara aktardık
        
            rakamString=String.valueOf(rakamChar);//rakamchar ı stringe çevirip rakamstringe aktardık
            
            rakamint=Integer.valueOf(rakamString);// haneyi rakaminte integer olarak aktardık
            
            if(i==1 || i==3 || i==5 || i==7 || i==9 || i==11 || i==13){
                
                rakamint*=2;//eğer i tekse rakaminti 2yle çarptık
            
                if(rakamint>9){// rakamint 9 dan büyükse
                
                    String dokuzdanBuyuk=String.valueOf(rakamint);//9dan büyük olan değeri dokuzdanbüyük stringine aktarır
                    
                    ilkHane=String.valueOf(dokuzdanBuyuk.charAt(0));//2 haneli sayının ilk hanesini ilk hane stringine aktardık
                    
                    ikinciHane=String.valueOf(dokuzdanBuyuk.charAt(1));//2. haneyi ikinci hane stingine aktardık
                    
                    dokuzbuyukTopla=Integer.parseInt(ilkHane)+Integer.parseInt(ikinciHane);//2 hanenin değerlerini topladık
                    
                    rakamint=dokuzbuyukTopla;//değeri rakamint e atadık
                
                }
            
            }
            
            imeiList.add(rakamint);//rakamint i imei liste ekledik
       
        }
        
        for(Integer sayılar:imeiList)
            listTopla+=sayılar;//bütün elemanları topladık
        
        onbes=(listTopla*9)%10;//bulduğumuz değeri 9 la çarpıp 10 labölümünden kalan değeri onbes e aktardık
        
        String onbesincihane_Parametre=String.valueOf(imeiNo.charAt(14));//parametreden gelen 15. hane
        
        String onbesinciHane_Hesaplanan=String.valueOf(onbes);
        
        if(onbesinciHane_Hesaplanan.equals(onbesincihane_Parametre))//parametreden gelen hesaplanana eşitse
            return  false;//yanlış
        else
            return true;//değilse doğru
             
        
    }
    
    
    
    
}
