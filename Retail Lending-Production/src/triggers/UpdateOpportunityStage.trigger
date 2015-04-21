trigger UpdateOpportunityStage on Opportunity (before update,before insert) {

    Opportunity thisOppty;

    for(Opportunity o:Trigger.New){
        thisOppty=o;
    }
    if(thisOppty.StageName!='Audited Appt' || 
       thisOppty.StageName!='Followup(FWP)'|| 
       thisOppty.StageName!='Sourcing'||
       thisOppty.StageName!='Dumped'){
            if(thisOppty.Max_of_Bank_Approval_Status__c==1){
                thisOppty.StageName='Sent to Bank';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==2){
                thisOppty.StageName='Logged';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==3){
                thisOppty.StageName='Queries&Discrepancies';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==4){
                thisOppty.StageName='Query Solved';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==5){
                thisOppty.StageName='Awaiting Approval';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==6){
                thisOppty.StageName='Credit Approved';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==7){
                thisOppty.StageName='Awaiting Legal Doc';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==8){
                thisOppty.StageName='Legal Queries';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==9){
                thisOppty.StageName='Legal Clearance';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==10){
                thisOppty.StageName='Valuation';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==11){
                thisOppty.StageName='Doc-Kit Signing';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==12){
                thisOppty.StageName='Agreed to Disburse';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==13){
                thisOppty.StageName='Awaiting Disbursal';
            }else if(thisOppty.Max_of_Bank_Approval_Status__c==14){
                thisOppty.StageName='Disbursed';
            }else{
               // thisOppty.StageName='Disbursed';
                //update thisOppty;
            
            }
    }
}



/*
for(Bank_Approached__c thisbapp:[select Approval_Status__c from Bank_Approached__c 
                                   where Opportunity__c=:thisOppty.id]){
*/