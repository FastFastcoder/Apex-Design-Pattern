// This code snippet demonstrates how the SupportService class can be used in practice.
// By passing the support type as a string, the correct support class is instantiated
// and its methods are called. The client code remains simple and does not need to
// know the specific class being instantiated.
SupportService service = new SupportService();
service.displaySupportDetails('AdminPremium');
