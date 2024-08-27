/**
 * DebitCardStrategy is a concrete implementation of the PaymentStrategy interface.
 * It handles payments using debit cards.
 */
public class DebitCardStrategy implements PaymentStrategy { 
    
    private String name; 
    private String cardNumber; 
    private String pin;  
     
    /* Constructor */ 
    public DebitCardStrategy(String name, String cardNumber, String pin) { 
        this.name = name; 
        this.cardNumber = cardNumber; 
        this.pin = pin; 
    } 
     
    /* Method from the PaymentStrategy interface */  
    public void pay(Double amount) { 
        System.debug('Web service callout to pay using Debit Card'); 
    }     
}
