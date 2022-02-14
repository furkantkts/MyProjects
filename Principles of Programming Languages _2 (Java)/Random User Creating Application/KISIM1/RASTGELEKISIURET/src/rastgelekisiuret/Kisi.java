/**
*
* @author Doğukan Dursun Furkan Tektaş dogukandursun55@hotmail.com
* @since 25.04.2020
* <p>
* rastgele kişi üretme
* </p>
*/
package rastgelekisiuret;


public  class Kisi {
    
    private KimlikNo tcKimlik;
    private Telefon telefon;
    private String isim_soyisim;   
    private int yas;
    Rastgele rastgele=new Rastgele();
   

    public Kisi() {        
        
        yas_uret();
        isimSoyisim_uret();
        kimlikNo_Uret();
        telefon_Uret();
     
    }    

    public String getTcKimlik() {
        return tcKimlik.getTC();
    }
    
    public String getIsim_soyisim() {
        return isim_soyisim;
    }

    public int getYas() {
        return yas;
    }

    public String getTelefon() {
        return telefon.getTel();
    }
    
    public String getImei() {
        return telefon.getImeino();
    }
    
    
       
    
    
    private void yas_uret() {
        this.yas = rastgele.rastgeleYasUret();        
    }
       
    
    private void isimSoyisim_uret() {
        this.isim_soyisim = rastgele.rastgeleIsimUret();       
    }

        
    private void kimlikNo_Uret(){
        tcKimlik=new KimlikNo();              
    }
    
      
    private void telefon_Uret(){          
        telefon=new Telefon();         
    }
    
    
    
    
    public boolean Tc_kontrol(String tc){
    
        if(tcKimlik.tcKimlik_Kontrol(tc))
            return false;
        else
            return true;
       
    }
    

    
    public boolean imei_Kontrol(String imei){
        
        if(telefon.checkImeino(imei))
            return true;
        else
            return false;
 
    }
    
    
 
}
