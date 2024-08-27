// The SupportService class is a client that utilizes the support objects. 
// Instead of directly creating instances of support classes, it calls the factory method 
// to get the appropriate support instance. This keeps the client code decoupled from 
// specific implementations, allowing for easy changes and extensions.
public class SupportService {
    public void displaySupportDetails(String supportType) {
        IAdminSupport support = AdminSupportFactory.getInstance(supportType);
        System.debug('Support SLA is - ' + support.getSLA());
        System.debug('Allowed tickets per month - ' + support.allowedTickets());
    }
}
