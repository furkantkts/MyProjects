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


public final class Telefon {
    
    private String TelefonNo="",hangiHat,telImeiNo;
    
    private final Rastgele rastgele=new Rastgele();
    
    private int alanNo;
    
    private IMEINo imeino;  
    
    
    
    public Telefon() { 
        imeino=new IMEINo();  
        
        telImeiNo=imeino.imeiNo_olustur();//telefonun imeinosu oluşturulur
        
        TelefonNo=TelefonNo_Uret(); //telefonno üretilir
        
    }
    
    public String getTel(){//telefonnoyu döndüren fonksiyon
        return TelefonNo;
    }

    public String getImeino() {//imeinoyu döndüren fonksiyon
              
        return telImeiNo;
    }
    
    public boolean checkImeino(String imei) {//imeinoyu kontrol ediyoruz
        
        if(imeino.imeiKontrol_et(imei)){//doğru olduğu durum
            
            return true;
        }
        else{//yanlış olduğu durum
            
            return false;      
        }
        
        
    }
       
    public String TelefonNo_Uret(){
        int gecici_sayi;
        
        ArrayList<Integer> tel_List=new ArrayList<>();
        
        final int[] turkcell={530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 561};
        final int[] vodafone={540, 541, 542, 543, 544, 545, 546, 547, 548, 549};
        final int[] turkTelekom={501, 505, 506, 507, 551, 552, 553, 554, 555, 559};
    
        int rastgeleHat=rastgele.rastgeleRakamUret()%3;//max 2 olacak şekilde rastgele sayı üretilir hangi hat olacagını belirlemek için
        
        switch(rastgeleHat){
        
            case 0:
                int rastgeleAlanNo_Turkcell=rastgele.rastgeleRakamUret()&11;//0 10 arası sayı üretilir
                
                alanNo=turkcell[rastgeleAlanNo_Turkcell];// dizide kaçıncı alannoyu seççegimiz belirlenir
                
                hangiHat="Turkcell";
                
                for(int i=0;i<9;i++){
                
                    if(i==0)//telefon numarasının ilk hanesine 0 atanır
                        gecici_sayi=0;
                    
                    else if(i==1)//numaranın alan nosu atanır
                        gecici_sayi=alanNo;
                    
                    else//kalan 7 hane rastgele üretilir
                        gecici_sayi=rastgele.rastgeleRakamUret();
                    
                    tel_List.add(gecici_sayi);
                                
                }
                break;
                
            case 1:
                int rastgeleAlanNo_Vodafone=rastgele.rastgeleRakamUret()&10;//vodafone da 10 farklı alan kodu var oyüzden mod 10
                
                alanNo=vodafone[rastgeleAlanNo_Vodafone];
                
                hangiHat="Vodafone";
                
                for(int i=0;i<9;i++){
                
                    if(i==0)// numaranın ilk hanesi 0
                        gecici_sayi=0;
                    
                    else if(i==1)//telefon numarasının alannosu 0dan sonra gelir
                        gecici_sayi=alanNo;
                    
                    else
                        gecici_sayi=rastgele.rastgeleRakamUret();//kalan 7 hane rastgele üretilir
                    
                    tel_List.add(gecici_sayi);//geçiçi sayı tel_list e eklenir
                                
                }
                break;
                
            case 2:
                int rastgeleAlanNo_TurkTelekom=rastgele.rastgeleRakamUret()&10;//turktelekomda 10 tane alan kodu var
                
                alanNo=turkTelekom[rastgeleAlanNo_TurkTelekom];
                
                hangiHat="Turk Telekom";
                
                for(int i=0;i<9;i++){
                
            switch (i) {
                case 0:
                    gecici_sayi=0;
                    break;
                case 1:
                    gecici_sayi=alanNo;
                    break;
                default:
                    gecici_sayi=rastgele.rastgeleRakamUret();
                    break;
            }
                    
                    tel_List.add(gecici_sayi);
                                
                }
                break;
      
        }
        
        for(int a=0;a<9;a++){
            
            TelefonNo+=String.valueOf(tel_List.get(a));//bütün haneler yanyana yazılarak telefonno oluşturulur
            
        }
        
        return TelefonNo;
    
    }
    
    public String telefon_Kontrol(String telNo){
        
        boolean gecerli_mi=false;
        
        String Alan_No,alanNo_string;
        
        System.out.println("İlk hane kontrol ediliyor...");
        
        try {
            Thread.sleep(1000);
        } catch (InterruptedException ex) {
            Logger.getLogger(Telefon.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(telNo.charAt(0)!='0'){//ilk hane 0 değilse 
            
            
            gecerli_mi=true;
            
            return "Böyle bir numara kullanılmamaktadır  -->  İlk hane 0 değil.";
        }   
        
        System.out.println("Alan numarası kontrol ediliyor..");
        
        try {
            Thread.sleep(1000);
        } catch (InterruptedException ex) {
            Logger.getLogger(Telefon.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Alan_No=telNo.substring(1, 4);
        
        alanNo_string=String.valueOf(alanNo);
        
        if(!Alan_No.equals(alanNo_string)){//alan nosu alanNo lardan hiçbirine eşit  değilse
            
            gecerli_mi=true;
            
            return "Böyle bir numara kullanılmamaktadır  -->  Alan numarası T.C. değil.";           
        }
       
        
        if(gecerli_mi==false){//Tüm şartlar uygunsa..
            
            System.out.print(hangiHat+" hatlı ");
            
            return "geçerli bir telefon numarası";
            
        }
        else
            return "";
            
    }
       
}
