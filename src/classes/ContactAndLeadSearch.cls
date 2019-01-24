public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String Searchstr){
        List<List<sObject>> searchlst= [FIND :Searchstr IN ALL FIELDS RETURNING CONTACT(FIRSTNAME,LASTNAME), LEAD(FIRSTNAME,LASTNAME)];
        SYSTEM.debug(searchlst);
        Contact[] SearchCon= (Contact[]) searchlst[0];
        Lead[] SearchLead= (Lead[]) searchlst[1];       
        return searchlst;        
    }
}