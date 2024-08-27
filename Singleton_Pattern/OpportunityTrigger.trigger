/**
 * OpportunityTrigger is used to handle before insert, before update, 
 * and after update events on the Opportunity object. 
 * It autopopulates the Area Office field based on the state and city, 
 * and manages broker commissions when an opportunity is closed won.
 */
trigger OpportunityTrigger on Opportunity (before insert, before update, after update) { 
    // Use the singleton instance of AreaOfficeUtil to minimize SOQL queries
    AreaOfficeUtil util = AreaOfficeUtil.getInstance(); 

    // This set will hold the IDs of all closed won Opportunities
    Set<Id> setClosedWonOpp = new Set<Id>(); 

    for(Opportunity opp : Trigger.New) { 
        // Handle before insert and before update events
        if(!Trigger.isAfter) { 
            // Check if the Area Office field is not populated and state and city fields are available
            if(opp.Area_Office__c == null && opp.State__c != null && opp.City__c != null) { 
                // Retrieve the Area Office based on state and city
                Area_Office__c ofc = util.getOffice(opp.State__c, opp.City__c); 
                if(ofc != null) { 
                    // Autopopulate the Area Office field
                    opp.Area_Office__c = ofc.Id; 
                }  
            } 
        } 

        // Handle after update event for closed won opportunities
        if(opp.StageName == 'Closed Won' && Trigger.isAfter && Trigger.isUpdate) { 
            // Add the opportunity ID to the set for further processing
            setClosedWonOpp.add(opp.Id); 
        } 
    } 

    // If there are any closed won opportunities, update the related brokers' commission status
    if(!setClosedWonOpp.isEmpty()) { 
        List<Broker__c> lstBrokersToUpdate = [SELECT Id, Commision__c, Opportunity__c FROM Broker__c WHERE Opportunity__c IN :setClosedWonOpp]; 
        for(Broker__c b : lstBrokersToUpdate) { 
            b.Commission__c = true; 
        } 
        // Perform a single DML update to avoid exceeding governor limits
        Database.update(lstBrokersToUpdate, false);  
    } 
}
