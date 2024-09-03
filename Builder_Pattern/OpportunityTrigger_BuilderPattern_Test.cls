@isTest
public class OpportunityTrigger_BuilderPattern_Test {

    static testMethod void validateState() {
        // Use Builder Pattern to create Opportunity Data
        OppTestData_Director director = new OppTestData_Director();
        Opportunity opp = director.construct(new OppTestData_ValidOfficeImpl());

        Test.startTest();
        insert opp;
        Test.stopTest();

        Opportunity oppInserted = [SELECT Area_Office__c FROM Opportunity WHERE Id = :opp.Id];
        
        // Confirm that Area office lookup is not blank
        System.assertNotEquals(oppInserted.Area_Office__c, null);
    }
}
