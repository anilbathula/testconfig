trigger Stage2Disbursed on Opportunity (after update) {
           
            Map<id,String> varmap=new Map<id,String>();
            Map<String,String> varmap1=new Map<String,String>();           
            List<Bank_Approached__c> lst=new List<Bank_Approached__c>();
            list<Loans__c>cs=new list<loans__c>();
           
    
    if(Trigger.isupdate){       
            
            for(Opportunity op:Trigger.New){               
                if(Trigger.oldMap.get(op.Id).Stagename!=Trigger.NewMap.get(op.Id).Stagename && op.StageName=='Disbursed'){          
                   varmap.put(op.Loan__c,'Disbursed');                           
                }
            }   
                     
         if(!varmap.isEmpty()){  
                  
            List<Loans__c> lnlst=[select id,name,Lender_1__c,Approval_Status__c,(select id,Name,Approval_Status__c,Bank_Name_2__c From Banks_Approached__r) from loans__c where id IN:varmap.keyset()];
               if(!lnlst.isEmpty()){ 
                    For(loans__c ln:lnlst){                      
                       // opp.Approval_Status__c=varmap.get(opp.id);                       
                      //  varmap1.put(ln.Lender_1__c,ln.Approval_Status__c); 
                      //  System.Debug('---->'+ln.Approval_Status__c);
                      //  cs.add(ln);               
                    
                        for(Bank_Approached__c ba:ln.Banks_Approached__r) {
                            if(ln.Lender_1__c==ba.Bank_Name_2__c){
                                ba.Approval_Status__c=varmap.get(ln.id);
                                System.Debug('---->'+varmap.get(ln.id));
                                lst.add(ba);
                            }
                        }
                    }
                    update cs;
                    update lst;                             
              
              }  
         }   
    }                           
}