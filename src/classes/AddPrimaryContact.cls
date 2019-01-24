public class AddPrimaryContact implements Queueable{
    private Contact C;
    private String State;
    
    public AddPrimaryContact(Contact C, String State){
        this.C=C;
        this.State=State;
    }
    public void execute(Queueablecontext Context){
       List<Account> AccountList= [SELECT ID, NAME,(SELECT ID, FIRSTNAME,LASTNAME FROM CONTACTS) FROM ACCOUNT
                                  WHERE BillingState =: State LIMIT 200]; 
        List<Contact> ConLst= new List<Contact>();
        for(Account Acc: AccountList){
            Contact Cont= C.Clone(false,false,false,false);
            Cont.AccountId=Acc.Id;
            ConLst.add(Cont);
        }
        if(ConLst.size()>0)
            insert ConLst;
    }
}