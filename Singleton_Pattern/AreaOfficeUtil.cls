/**
 * J Kim
 * This class demonstrates the Singleton Design Pattern in Apex.
 * The class is responsible for querying Area Office records based on state and city.
 * The Singleton pattern ensures that only one instance of this class is created per transaction.
 */
public class AreaOfficeUtil {

    private List<Area_Office__c> lstAllOffices;
    private Map<String, Area_Office__c> mpAllOffices;

    // Static variable to hold the single instance of the class
    private static AreaOfficeUtil selfInstance = null;

    // Private constructor to prevent direct instantiation
    private AreaOfficeUtil() {
        lstAllOffices = [
            SELECT Name, City__c, State__c, Manager__c, Head_Count__c
            FROM Area_Office__c
            LIMIT 2000
        ];

        mpAllOffices = new Map<String, Area_Office__c>();

        for (Area_Office__c ofc : lstAllOffices) {
            mpAllOffices.put(ofc.State__c + '-' + ofc.City__c, ofc);
        }
    }

    // Static method to provide the single instance of the class
    public static AreaOfficeUtil getInstance() {
        if (selfInstance == null) {
            selfInstance = new AreaOfficeUtil();
        }
        return selfInstance;
    }

    // Method to retrieve the Area Office record based on state and city
    public Area_Office__c getOffice(String state, String city) {
        return mpAllOffices.get(state + '-' + city);
    }
}
