// J Kim
// The AdminSupportFactory class centralizes the logic for creating instances 
// of different support types. The getInstance method takes the support type as 
// input and returns an object of the corresponding support implementation class.
// This abstraction allows for easy extension with new support types without
// modifying existing client code.
public class AdminSupportFactory {
    public static IAdminSupport getInstance(String supportType) {
        IAdminSupport support = null;

        if (supportType == 'AdminBasic') {
            support = new AdminBasicSupportImpl();
        } else if (supportType == 'AdminPremium') {
            support = new AdminPremiumSupportImpl();
        } else if (supportType == 'AdminGold') {
            support = new AdminGoldSupportImpl();
        } else if (supportType == 'AdminPlatinum') {
            support = new AdminPlatinumSupportImpl();
        }

        return support;
    }
}
