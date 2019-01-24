@isTest
public class AddPrimaryContactTest {
    @testSetup
    Static void setup(){
        List<Account> AccList= New List<Account>();
        for(Integer i=0;i<50;i++){
            Account a= new Account(Name='TestAccountPrimCon'+i,BillingState='NY');
            AccList.add(a);
        }
        for(integer j=50;j<100;j++){
            Account b= new Account(Name='TestAccountPrimCon'+j,BillingState='CA');
            AccList.add(b);
        }
            Insert AccList;
    }
    static testmethod void test(){
        Contact con= new Contact();
        con.LastName='PrimContactTestLN';
        con.FirstName='PrimContactTestFN';
        insert con;
        AddPrimaryContact apc= new AddPrimaryContact(con,'CA');
        test.startTest();
        system.enqueueJob(apc);
        test.stopTest();
        system.debug('end of test');
        system.assertEquals(50, [SELECT COUNT() FROM CONTACT WHERE ACCOUNTID IN
                                 (SELECT ID FROM ACCOUNT WHERE BillingState='CA')]);        
        
        
    }

}