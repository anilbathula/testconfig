trigger createloan on Opportunity (after insert,after update) {
    Opportunity oppn;    
    Set<id> ids=new Set<id>();
    List<loans__c> ln=new List<loans__c>();
    
    for(Opportunity op: Trigger.New) {
        ids.add(op.id);        
    }
    
    List<Opportunity> opp=[select id,Name,StageName,loan__c,RecordType.Name,Borrower__c,Borrower__r.email,(select id,Name,opportunity__c from loans__r) from Opportunity where id in:ids];
    for(Opportunity op:opp){
        if(op.loans__r.size()==0){
           if(op.StageName=='Sourcing'||op.StageName=='Sent to Bank'||op.StageName=='Logged'||op.StageName=='Queries&Discrepancies'||
           op.StageName=='Query Solved'||op.StageName=='Awaiting Approval'||op.StageName=='Legal Queries'||
           op.StageName=='Legal Clearance'||op.StageName=='Valuation'||op.StageName=='Doc-Kit Signing'
           ||op.StageName=='Awaiting Legal Doc'||op.StageName=='Credit Approved'&& op.Loan__c==null) {     
           system.debug('--->'+op.Recordtype.Name);
           id rtid=[select id,name from recordtype where sobjectType='loans__c' AND Name=:op.Recordtype.Name].id;
           system.debug('--->'+rtid);
                loans__c l=new loans__c();
                l.Name=op.Name;
                l.Approval_Status__c=op.StageName;
                l.Opportunity__c=op.Id;
                l.Borrower__c=op.Borrower__c;
                l.recordtypeid=rtid;
                l.borrower_email__c=op.Borrower__r.email;
                ln.add(l);
                System.debug('---->'+l.id);
            }
        }
    }
    insert ln;  
    
}
//&&trigger.oldMap.get(op.id).Stagename!=trigger.NewMap.get(op.id).stageName 
/*=============================================================================
Below trigger will work with the help of future class to update the loan value
in opportunity when a loan is created no Need of two triggers one on opportunity
other on loan .But a draw back is we need to refresh the opportunity record twice
to see the value.
================================================================================*/
/*trigger createloan on Opportunity (after update) {
if(staticFlag.a){
    
    List<Opportunity> oppn=new List<Opportunity>();  
    List<loans__c> ln=new List<loans__c>();
    List<id> ids=new List<id>();
    Map<ID,ID> varmap=new Map<ID,ID>();
    Set<ID> ids1=new Set<ID>();
    List<Co_Applicant__c> coApplicant = new List<Co_Applicant__c>();
    for(Opportunity op: Trigger.New) {
        ids.add(op.id);
        oppn.add(op);
    }
    //List<loans__c> lon=[select id,Name,opportunity__c from loans__c where opportunity__c in:ids];
    List<Opportunity> opp=[select id,Name,StageName,loan__c,Borrower__c,(select id,Name,opportunity__c from loans__r) from Opportunity where id in:ids];
    for(Opportunity op:opp){
        if(op.loans__r.size()==0){
           if(op.StageName=='Sourcing' &&  op.Loan__c==null ) {    
                loans__c l=new loans__c(Name=op.Name,Approval_Status__c=op.StageName,Opportunity__c=op.Id,Borrower__c=op.Borrower__c);
                ln.add(l);
                System.debug('---->'+l.id);
            }
        }
    }
    insert ln;  
    for(loans__c l:ln){
       varmap.put(l.opportunity__c,l.id);
    }
    
    opp_future_update.processconfirm(varmap);
 }  
}*/
/********************************************************
Old trigger to update borrower from opportunity to loan
********************************************************/
/*trigger loan1 on opportunity (after update) {

  Map<Id,Id> loanOldBrokerMap = new Map<Id,Id>();
  List<Opportunity> loanList=new List<Opportunity>();
  Map<Id,Id> OldBrokerToNewBrokerMap=new Map<Id,Id>();
    for(Opportunity l: trigger.New){
        if(Trigger.isInsert || (trigger.isUpdate && trigger.oldMap.get(l.Id).Borrower__c!=l.Borrower__c)){
         loanOldBrokerMap.put(l.Id, trigger.oldMap.get(l.Id).Borrower__c);
         loanList.add(l);
         OldBrokerToNewBrokerMap.put(trigger.oldMap.get(l.Id).Borrower__c,l.Borrower__c);
        }
    }
    
    if(loanList.size()>0){
        List<loans__c> opptyList=[select Id,Borrower__c from loans__c where Borrower__c IN :  loanOldBrokerMap.values() ] ;
        for(loans__c oppty: opptyList){
            oppty.Borrower__c =OldBrokerToNewBrokerMap.get(oppty.Borrower__c);
        } 
        update opptyList;
    }
}*/