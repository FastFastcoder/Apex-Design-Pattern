/**
 * CreditCardStrategy is a concrete implementation of the PaymentStrategy interface.
 * It handles payments using credit cards.
 */
public class CreditCardStrategy implements PaymentStrategy { 
     
    private String name; 
    private String cardNumber; 
    private String cvv; 
    private String dateOfExpiry; 
     
    /* Constructor */ 
    public CreditCardStrategy(String name, String cardNumber, String cvv, String dateOfExpiry) { 
        this.name = name; 
        this.cardNumber = cardNumber; 
        this.cvv = cvv; 
        this.dateOfExpiry = dateOfExpiry;         
    } 
     
    /* Method from the PaymentStrategy interface */  
    public void pay(Double amount) { 
        System.debug('Web service callout to pay using credit card'); 
    } 
}
