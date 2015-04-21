trigger MapCoApplicant on Lead (after update,after insert) {
    Lead ld;
    List<Co_Applicant__c> coApplicant = new List<Co_Applicant__c>();
    for(Lead l: Trigger.New){
        ld=l;
    }
    if(ld.isConverted == true){    //ld.Status=='Followup(FWP)'              
        for (Co_Applicant__c coAppTemp : [Select id, Opportunity__c from 
            Co_Applicant__c where Lead__c=:ld.id]){
            coAppTemp.Opportunity__c = ld.ConvertedOpportunityId;
            if(ld.Company!=null){
                coAppTemp.Co_Applicant_For__c =ld.ConvertedContactId;
            }
            coApplicant.add(coAppTemp);
        }
    }
    if(coApplicant !=null) update coApplicant;
}