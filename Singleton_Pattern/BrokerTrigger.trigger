/**
 * BrokerTrigger is used to handle before insert and before update events 
 * on the Broker__c object. It autopopulates the Area Office field based on 
 * the broker's state and city using the singleton instance of AreaOfficeUtil.
 */
trigger BrokerTrigger on Broker__c (before insert, before update) { 
    // Use the singleton instance of AreaOfficeUtil to minimize SOQL queries
    AreaOfficeUtil util = AreaOfficeUtil.getInstance(); 

    for(Broker__c b : Trigger.New) { 
        // Check if the Area Office field is not populated and state and city fields are available
        if(b.Area_Office__c == null && Trigger.isBefore && b.State__c != null && b.City__c != null) { 
            // Retrieve the Area Office based on state and city
            Area_Office__c ofc = util.getOffice(b.State__c, b.City__c); 
            if(ofc != null) { 
                // Autopopulate the Area Office field
                b.Area_Office__c = ofc.Id; 
            }  
        } 
    } 
}
