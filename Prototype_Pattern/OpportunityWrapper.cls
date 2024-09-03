public class OpportunityWrapper implements IClone {

    private Opportunity opp;

    public void setOpportunity(Opportunity o) {
        opp = o;
    }

    public String getOpportunityName() {
        return opp != null ? opp.Name : '';
    }

    public void setOpportunityName(String name) {
        if (opp != null) {
            opp.Name = name;
        }
    }

    // Implement cloneObject() method from interface "IClone"
    public IClone cloneObject() {

        // Create a new instance of OpportunityWrapper
        OpportunityWrapper clonedObject = new OpportunityWrapper();

        // Use the clone() method of SObject to create a deep copy of the Opportunity
        Opportunity clonedOpp = opp.clone(false, false, false, false);
        clonedObject.setOpportunity(clonedOpp);

        return clonedObject;
    }
}
