public class AccountProcessor {
    @future
    Public static void countContacts(List<Id> ListAccountId){
        List<Account> AccList= New List<Account>();
        List<Account> AccountList = new List<Account>([select id, name, Number_of_Contacts__c,(select Id, name from Contacts) 
                                                       from Account where Id in:ListAccountId]);
        for(Account Acc: AccountList){
            List<Contact> ContactList = Acc.Contacts;
            acc.Number_of_Contacts__c=ContactList.Size();
            AccList.add(acc);
            system.debug(AccList);
        }
  
            If(AccList.size()>0)
            {	system.debug(AccList);
                 Update AccList; 
            }
              

    }

}