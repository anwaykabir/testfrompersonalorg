@IsTest
public class AccountProcessorTest {
    Public static testMethod  void AccountProcessorTestMethod(){
        test.startTest();
        Account a= New Account(name='Test account2');
        insert a;
        Id AccountId= a.Id;
        system.debug('AccountId:'+AccountId);
        
        Contact C= new Contact(LastName='TestAccConact2', AccountId=AccountId);
        Insert C;
        List<Id> ListAccountId= New List<Id>();
        ListAccountId.add(AccountId);
        AccountProcessor.countContacts(ListAccountId);
        test.stopTest();
        system.debug(ListAccountId);
        
    }

}