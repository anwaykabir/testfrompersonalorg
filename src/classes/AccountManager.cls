@RestResource(urlmapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static account getAccount(){
        RestRequest request= RestContext.request;
        system.debug('request:'+request.requestURI);
        String AccountId= request.requestURI.substringBetween('Accounts/','/contacts');
        Account AccOBJ= [SELECT ID,NAME, (SELECT ID, name FROM CONTACTS) FROM ACCOUNT 
                                                 WHERE ID=:AccountId];
        return AccOBJ;
    }

}