// The IAdminSupport interface defines a contract for all support classes.
// Any class implementing this interface must provide implementations for the
// getSLA() and allowedTickets() methods. This allows the factory method to 
// return objects of a common type, enabling polymorphism.
public Interface IAdminSupport {
    Integer getSLA();
    Integer allowedTickets();
}
