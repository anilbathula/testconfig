@isTest
private class MyTest {
    static testMethod void myTestLeadConvert() {
        Lead l = new Lead(LastName='Bathula', Status='Followup(FWP)');
        insert l;
        Co_Applicant__c ca1 = new Co_Applicant__c(Name='Anil Bathula');
        Co_Applicant__c ca2 = new Co_Applicant__c(Name='Raghu');
        ca1.Lead__c = l.id;
        ca2.Lead__c = l.id;
        insert ca1; insert ca2;
        
        // convert the lead
        Database.LeadConvert lc =
        new database.LeadConvert();        
        lc.setLeadId(l.Id);        
        LeadStatus convertstatus = [select Id, MasterLabel from LeadStatus where IsConverted=
        true limit 1];        
        lc.setConvertedStatus(convertStatus.MasterLabel);        
        Database.LeadConvert[] lcArray =
        new Database.LeadConvert[] {lc};        
        Database.LeadConvertResult[] results = Database.convertLead(lcArray);        
        System.assert(results[0].IsSuccess());
                
    
    }
}