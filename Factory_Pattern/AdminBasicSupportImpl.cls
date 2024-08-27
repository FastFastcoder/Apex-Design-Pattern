// AdminBasicSupportImpl class implements the IAdminSupport interface. 
// This class represents the Basic support type with specific SLA and ticket limits.
// Each support type has its own implementation class, which provides the 
// concrete behavior for that support level.
public class AdminBasicSupportImpl implements IAdminSupport {
    public Integer getSLA() {
        return 40;
    }

    public Integer allowedTickets() {
        return 9999;
    }
}

// AdminPremiumSupportImpl class implements the IAdminSupport interface.
// This class represents the Premium support type with specific SLA and ticket limits.
public class AdminPremiumSupportImpl implements IAdminSupport {
    public Integer getSLA() {
        return 12;
    }

    public Integer allowedTickets() {
        return 50;
    }
}

// Similarly, other support levels can be implemented:
// AdminGoldSupportImpl and AdminPlatinumSupportImpl...
