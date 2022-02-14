/**
*
* @author Doğukan Dursun Furkan Tektaş dogukandursun55@hotmail.com
* @since 25.04.2020
* <p>
* rastgele kişi üretme
* </p>
*/
package rastgelekisiuret;



public class RastgeleKisi extends Kisi {

    public RastgeleKisi() {       
        super();
    }
    
    
    @Override
    public String getIsim_soyisim() {
        return super.getIsim_soyisim(); 
    }

    @Override
    public int getYas() {
        return super.getYas();
    }

    @Override
    public String getImei() {
        return super.getImei(); 
    }

    @Override
    public String getTelefon() {
        return super.getTelefon(); 
    }

    @Override
    public String getTcKimlik() {
        return super.getTcKimlik(); 
    }

       
    public String RastgeleKisi_Uret() {
        
            return getTcKimlik()+" "+getIsim_soyisim()+" "+getYas()+" "+getTelefon()+" ("+getImei()+") ";
               
        }

   
    
}
