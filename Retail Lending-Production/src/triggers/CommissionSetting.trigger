trigger CommissionSetting on Commission__c (after insert, after update,before update) {

    id csid;
    decimal total=0;
    decimal currMonachieve=0;
    Commission__c thiscomm;    

    for(Commission__c c:trigger.new){
        thiscomm=c;
    }
  
    Commission_Setting__c cs= [select id, Total_Achievement_Till_Date__c,Achieved_for_Current_Month__c                                
                               from Commission_Setting__c
                               where id=:thiscomm.Commission_Setting__c];    
    
    for(Commission__c comm: [select Amount_Eligible__c,Current_Month_Revenue__c 
                             from Commission__c where 
                             Commission_Setting__c=:cs.id]){   
        total=total+Comm.Amount_Eligible__c;    
        currMonachieve=currMonachieve+Comm.Current_Month_Revenue__c;
    }
    
    cs.Total_Achievement_Till_Date__c=total;
    cs.Achieved_for_Current_Month__c=currMonachieve;
    update cs;
}