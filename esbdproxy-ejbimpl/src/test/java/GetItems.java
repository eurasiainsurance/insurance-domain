import java.util.Iterator;

import kz.theeurasia.asb.esbd.jaxws.ArrayOfItem;
import kz.theeurasia.asb.esbd.jaxws.IICWebService;
import kz.theeurasia.asb.esbd.jaxws.IICWebServiceSoap;
import kz.theeurasia.asb.esbd.jaxws.Item;
import kz.theeurasia.asb.esbd.jaxws.User;

public class GetItems {
    private static final String ESBD_WS_USER_NAME = "EUR.SSL.GORDOVA";
    private static final String ESBD_WS_USER_PASSWORD = "Be$tKe7";

    private IICWebServiceSoap soap;
    private String sessionId;

    public static void main(String[] args) {
	GetItems items = new GetItems();
	items.run();
    }

    private void run() {
	IICWebService service = new IICWebService();
	soap = service.getIICWebServiceSoap();
	User user = soap.authenticateUser(ESBD_WS_USER_NAME, ESBD_WS_USER_PASSWORD);
	sessionId = user.getSessionID();
	dumpCancelationReasonTypes();
	dumpCountryInfo();
	dumpClassUsingTypes();
	dumpBranchInfo();
	dumpEconomicsSector();
    }

    private void dumpEconomicsSector() {
	dumpCodes("EconomicsSector", "ECONOMICS_SECTORS");
    }

    private void dumpCancelationReasonTypes() {
	dump("CancelationReasonType", "RESCINDING_REASONS");
    }

    private void dumpClassUsingTypes() {
	dump("CancelationReasonType", "CLASS_USING");
    }

    private void dumpCountryInfo() {
	dumpCodes("CountryInfo", "COUNTRIES");
    }

    private void dumpBranchInfo() {
	dumpCodes("BranchInfo", "OGPO_TRANSPORT_TYPES");
    }

    private void dump(String className, String dictionaryName) {
	System.out.println(dictionaryName);

	System.out.println("public enum " + className + "Info {");
	ArrayOfItem items = soap.getItems(sessionId, dictionaryName);
	if (items == null)
	    return;
	Iterator<Item> i = items.getItem().iterator();
	while (i.hasNext()) {
	    Item item = i.next();
	    System.out.println("\tREASON_" + item.getID() + "(" + item.getID() + ")" + (i.hasNext() ? "," : ";") + " //"
		    + item.getName());
	}
	System.out.println("}");
    }

    private void dumpCodes(String className, String dictionaryName) {
	System.out.println(dictionaryName);

	System.out.println("public enum " + className + "Info {");
	ArrayOfItem items = soap.getItems(sessionId, dictionaryName);
	if (items == null)
	    return;
	Iterator<Item> i = items.getItem().iterator();
	while (i.hasNext()) {
	    Item item = i.next();
	    System.out.println("\tCOUNTRY_CODE_" + item.getCode() + "(" + item.getID()
		    + ", \"" + item.getCode() + "\")" + (i.hasNext() ? "," : ";") + " //"
		    + item.getName());
	}
	System.out.println("}");
    }
}
