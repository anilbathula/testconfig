trigger loanlookup on loans__c (After Insert) {
    Opportunity opp;
    loans__c l;
    
    for(loans__c ls:trigger.new){
        l=ls;
     }
     if(l.Opportunity__c!=null){    
     opp= [select id ,Name,Borrower__c, Loan__c,StageName,Closed_Won__c from Opportunity where id=:l.Opportunity__c limit 1];
        if(opp.Loan__c==null ){
            opp.Loan__c=l.id;
            opp.Borrower__c=l.Borrower__c;
            update Opp;
    }
    }
       
    
}