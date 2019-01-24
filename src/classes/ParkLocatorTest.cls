@isTest
public class ParkLocatorTest {
    public static testmethod void execute(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] Parks= ParkLocator.country('United States');
        system.debug('Parks:'+Parks);
    }

}