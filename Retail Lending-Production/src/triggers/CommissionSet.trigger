trigger CommissionSet on Commission__c (before update, before insert) {

    Commission__c Comm;
    Id CsId; 
 
    for(Commission__c d: Trigger.New){
        Comm = d;    
        CsId= d.User__c;
    }
    if(CsId!=null){
        Commission_Setting__c cs= [select Name,id from Commission_Setting__c 
                                    where 
                                    Commission_For_User__c=:CsId];        
        Comm.Commission_Setting__c=cs.id;
    }
}