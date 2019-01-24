@istest
public class AnimalsCalloutsTest {
    @istest static void testGetCallout(){
        StaticResourceCalloutMock mock= new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response= AnimalsCallouts.makeGetCallout();
        HttpResponse response1= AnimalsCallouts.makePostCallout();
    }

}