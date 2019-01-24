global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx){
        List<Lead> LeadUpd= new List<Lead>();
        List<Lead> LeadList=[SELECT ID,LeadSource FROM LEAD WHERE LeadSource = NULL LIMIT 200];
        for(Lead Ld:LeadList){
            Ld.LeadSource='Dreamforce';
            LeadUpd.add(Ld);
        }
        if(LeadUpd.size()>0)
        {
           update LeadUpd;
            system.debug('Lead Updated:'+LeadUpd);
        }
        
    }

}