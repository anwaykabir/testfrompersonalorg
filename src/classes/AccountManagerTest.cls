@IsTest
public class AccountManagerTest {
    public static testmethod void testGetAccount(){
        Id accId= createAccount();
        system.debug('accId:'+accId);
        RestRequest request= new RestRequest();
        request.requestURI='https:/na59.lightning.force.com/services/apexrest/Accounts/'+accId+'/contacts';
        request.httpMethod='GET';
        RestContext.request=request;
        Account a=AccountManager.getAccount();
        
    }

    public static Id createAccount(){
        Account a= new Account(Name='testaccount');
        insert a;
        Contact c = new Contact(LastName = 'test Contact',AccountId=a.Id);
        insert c;
        return a.id;
    }
}