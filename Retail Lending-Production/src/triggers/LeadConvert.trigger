trigger LeadConvert on Lead (after update) {
 
  // no bulk processing; will only run from the UI
  if (Trigger.new.size() == 1) { 

    if (Trigger.new[0].ConvertedOpportunityId != null ) { 
        // update the converted opportunity with some text from the lead        
        id rtid=[select id,name from recordtype where name=:trigger.new[0].RecordType__c and sobjecttype='opportunity' limit 1 ].id;      
        Opportunity opp = [Select o.Id,o.recordtype.id from Opportunity o Where o.Id = :Trigger.new[0].ConvertedOpportunityId];
        opp.Name=Trigger.New[0].FirstName+' '+Trigger.new[0].LastName;     
        opp.Description=Trigger.new[0].Description;   
        opp.Buyer_Name1__c = Trigger.new[0].ConvertedContactId;
        opp.Buyer_Email_ID__c=Trigger.new[0].Email;
        opp.Borrower__c=Trigger.new[0].ConvertedContactId;   
        opp.recordtypeid=rtid;             
        update opp;
        }
    }      
  }
  
  //junk code
  /*lead l;
id rtid=[select id,name from recordtype where name='Home loan' and sobjecttype='lead' limit 1 ].id;*/