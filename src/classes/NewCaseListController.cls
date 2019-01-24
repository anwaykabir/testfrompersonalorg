public class NewCaseListController {
    public List<Case> getNewCases(){
        List<Case> C = Database.query('SELECT ID, CaseNumber FROM CASE WHERE Status=\'New\'');
        system.debug('From Inside controller:'+ C);        
        return C;
    }
}