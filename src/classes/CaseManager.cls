@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager {
    @HTTPGet
    Global static Case getCasebyId(){
        RestRequest request= RestContext.request;
        system.debug('request:'+request.requestURI);
        String CaseId= request.requestURI.substring(request.requestURI.lastindexof('/')+1);
        Case result=[SELECT CASENUMBER, SUBJECT, STATUS,ORIGIN, PRIORITY FROM CASE WHERE ID=:CaseId];
        return result;
    }
    
    @HTTPPost
    Global static Id CreateCase(String subject, String status,String origin, String priority){
        Case thisCase= new case(Subject=subject,Status=status,Origin=origin,Priority=priority);
        insert thisCase;
        return thisCase.Id;
    }
        @HttpPatch
    Global static Id UpdateCaseFields(){
        Id CId;
        RestRequest request= RestContext.request;
        string CaseId=request.requestURI.substring(request.requestURI.lastindexof('/')+1);
        Case thisCase= [SELECT Id FROM CASE WHERE Id=:CaseId];
        system.debug('Case Object:'+thisCase);
        Map<String, Object> params= (Map<String,Object>) Json.deserializeUntyped(request.requestBody.toString());
        system.debug('Map Object:'+params);
        for(String FieldName:params.keyset()){
            thisCase.put(fieldname,params.get(fieldname));
           
        system.debug('thisCase after update through map:'+thisCase);
        update thisCase;
        }
        
        return thisCase.Id;   
    }
}