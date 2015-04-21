trigger Bank on Opportunity (before insert) {
    //this trigger seems not of use as bank approached has oppn as mandatory field, hence while
    //creating BA you will link it to oppn
    loans__c ln= new loans__c();
    Opportunity o;
    list<Bank_Approached__c> bn =new list<Bank_Approached__c>();
    
    for(Opportunity os:trigger.new){
        o=os;    
    }

    List<Opportunity> opp=[Select id from Opportunity where Loan__c=:o.Loan__c];   
    List<Opportunity> op=[Select Loan__c from Opportunity where id=:opp];
        
    for(Bank_Approached__c b:[Select Opportunity__c from  Bank_Approached__c 
           where Loan__c=:o.Loan__c]){
        b.Opportunity__c=o.id;
        bn.add(b);
    }
       Update bn;
       
}