@isTest
public class DailyLeadProcessorTest {
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
        DailyLeadProcessor dp= new DailyLeadProcessor();
        string sch='0 08 17 1-31 1-12 ? 2018';
        String JobId= system.schedule('Update Lead Source', sch, dp);
        test.stopTest();
      
     }
}