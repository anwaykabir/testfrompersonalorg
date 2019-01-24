@isTest
global class ParkServiceMock implements WebServiceMock{

    global void doInvoke (Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType){
        parkService.byCountryResponse response_x= new parkService.byCountryResponse();
        String[] ParkLists= new String[]{'Park1','Park2'};
        response_x.return_x=ParkLists;
        response.put('response_x', response_x);
    }
}