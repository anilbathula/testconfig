trigger Disbursement on Disbursement__c (before insert,before update) {
    //This trigger is used to update the loan detail from oppn into disb
    Disbursement__c thisDisb;
    Id oppnId;

    for(Disbursement__c d: Trigger.New){
        thisDisb = d;    
        oppnId = d.Opportunity__c;     
    }
    
    if(thisDisb.Loan__c==null){
        Opportunity oppn = [Select Loan__c from Opportunity where id=:oppnId];        
        thisDisb.Loan__c= oppn.Loan__c;
    }
    
}