@isTest
public class OppTestData_ValidOfficeImpl implements IOppTestDataBuilder {

    public Opportunity opp;
    private User u;
    private Area_Office__c aofc;

    public void createManager() {
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        u = new User(
            Alias = 'standt',
            Email = 'dummyEmail@email.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Testing',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = 'dummyEmail' + Crypto.getRandomInteger() + '@email.com'
        );
        insert u;
    }

    public void createAreaOffice() {
        aofc = new Area_Office__c(
            Manager__c = u.Id,
            State__c = 'CT',
            City__c = 'Manchester'
        );
        insert aofc;
    }

    public void createOpportunity() {
        opp = new Opportunity(
            Name = 'Test Opportunity',
            CloseDate = Date.today().addDays(7),
            StageName = 'Prospecting',
            State__c = 'CT',
            City__c = 'Manchester'
        );
    }

    public Opportunity getOpportunity() {
        return opp;
    }
}
