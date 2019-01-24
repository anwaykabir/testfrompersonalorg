@isTest
public class LeadProcessorTest {
    @testSetup
    static void setup(){
        List<Lead> LeadList= new List<Lead>();
        for(Integer Count=0;count<200;count++)
        {
            Lead Ld= new Lead (lastName= 'testLead'+Count, Company='testCompany');
            LeadList.add(Ld);
        }
        insert LeadList;
    }
    static testMethod Void test(){
        test.startTest();
        LeadProcessor lp= new LeadProcessor();
        Id batchId= database.executeBatch(lp, 200);
        test.stopTest();
        integer TestCount= [select count() from lead];
        system.debug('TestCount:'+TestCount);
    }

}