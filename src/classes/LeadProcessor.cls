global class LeadProcessor implements database.Batchable<sObject>, Database.Stateful {
    global integer RecordProcesed=0;
    global Database.QueryLocator Start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id, LeadSource from Lead');
    }
    global void execute(Database.BatchableContext BC, List<Lead> Scope){
        List<Lead> LeadList= new List<Lead>();
        for(Lead Ld: Scope){
            Ld.LeadSource='Dreamforce';
            LeadList.add(Ld);
            RecordProcesed=RecordProcesed+1;
        }
        update LeadList;
        
    }
    global void finish(Database.BatchableContext BC){
        
        system.debug('Number Of Record processed:'+RecordProcesed);
        AsyncApexJob Job= [SELECT ID,STATUS, NumberOfErrors,JobItemsProcessed FROM AsyncApexJob WHERE Id= :BC.getJobId()];
        system.debug(Job);
    }

}