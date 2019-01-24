trigger AccountAddressTrigger on Account (before insert, before update) {
    List<Account> AccountListUpd= new List<Account>();
    
    for(Account acnt:Trigger.New)
    {
        If(acnt.Match_Billing_Address__c)
        {
            acnt.ShippingPostalCode=acnt.BillingPostalCode;          
            /*if(Trigger.OldMap.get(acnt.Id).BillingPostalCode !=Trigger.OldMap.get(acnt.Id).ShippingPostalCode)
            {
                system.debug('Inside 2nd if');
                
            }*/
                
        }
    }

}