@istest
public class AnimalLocatorTest {
    public static testMethod void Execute(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String response= AnimalLocator.getAnimalNameById(1);
        system.debug('response on Test Class:'+response);
    }

}