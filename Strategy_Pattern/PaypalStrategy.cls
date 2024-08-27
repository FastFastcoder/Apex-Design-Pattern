/**
 * PaypalStrategy is a concrete implementation of the PaymentStrategy interface.
 * It handles payments using PayPal.
 */
public class PaypalStrategy implements PaymentStrategy { 
     
    private String emailId; 
    private String password; 
     
    /* Constructor */ 
    public PaypalStrategy(String emailId, String password) { 
        this.emailId = emailId; 
        this.password = password; 
    } 
     
    /* Method from the PaymentStrategy interface */  
    public void pay(Double amount) { 
        System.debug('Web service callout to pay using PayPal Account'); 
    } 
}
