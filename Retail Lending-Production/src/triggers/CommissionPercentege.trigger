trigger CommissionPercentege on Opportunity (before insert, before update) {

    Opportunity o;
    
    for(Opportunity os:trigger.new){
        o=os;    
    }
    
    if(o.Commission_Setting__c !=null){
        Commission_Setting__c c=[Select id,Commission_for_Bank__c
            from
            Commission_Setting__c
            where 
            id=:o.Commission_Setting__c];
    
        o.Commission_Percentage_from_Bank__c=c.Commission_for_Bank__c;
    }
}