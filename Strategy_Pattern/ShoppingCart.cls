/**
 * ShoppingCart class is used to manage songs in a shopping cart and process payments using a selected payment strategy.
 * It supports adding and removing songs, calculating the total amount, and paying using the chosen payment method.
 */
public class ShoppingCart { 
     
    List<Music_Library__c> lstSongs; 
         
    /* Constructor */ 
    public ShoppingCart() { 
        lstSongs = new List<Music_Library__c>(); 
    } 
     
    /* Add music to the cart */ 
    public void addSong(Music_Library__c m) { 
        lstSongs.add(m); 
    } 
     
    /* Remove music from the cart */ 
    public void removeSong(Music_Library__c songToRemove) { 
        Integer index = -1;  
        for(Music_Library__c m : lstSongs) { 
            index++; 
            if(m.Id == songToRemove.Id) { 
                lstSongs.remove(index); 
                break; 
            } 
        } 
    } 
     
    /* Calculate total amount and pay using selected payment strategy */ 
    public void pay(PaymentStrategy payMethod) { 
        Double finalAmount = 0; 
         
        for(Music_Library__c m : lstSongs) { 
            finalAmount += m.price__c; 
        } 
        System.debug('Total amount to be paid - ' + finalAmount); 
        payMethod.pay(finalAmount); 
    } 
}
