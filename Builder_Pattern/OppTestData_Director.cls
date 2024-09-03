@isTest
public class OppTestData_Director {

    public Opportunity construct(IOppTestDataBuilder oppBuilder) {
        oppBuilder.createManager();
        oppBuilder.createAreaOffice();
        oppBuilder.createOpportunity();
        return oppBuilder.getOpportunity();
    }
}
