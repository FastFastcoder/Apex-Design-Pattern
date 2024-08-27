/**
 * PaymentStrategy is an interface that must be implemented by all payment method classes.
 * It defines the method pay(), which will be used to process payments using different strategies.
 */
public interface PaymentStrategy { 
     void pay(Double amount); 
}
