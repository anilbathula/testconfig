trigger Commentsonconvert on Lead (after update,after insert) {
     List<String> leadIDs = new List<String>();
     List<Comments__c> Com = new List<Comments__c>();    
     map<id,Lead> smap=new map<id,Lead>();
         for(Lead l: Trigger.New) {
             if (l.isConverted == true) { 
                 smap.put(l.id,l);
                 leadIDs.add(l.Id);                
             } 
         }
 /*Querying for comments which are linked with lead and assiging the converted lead id to Contact and Opportunity*/        
     List <Comments__c> cs = [Select id,contact__c, opportunity__c, Lead__c from Comments__c where Lead__c IN :leadIDs]; 
         for (Comments__c comTemp :cs ) { 
             if(smap.ContainsKey(comtemp.Lead__c)){
                   comTemp.opportunity__c = smap.get(comtemp.Lead__c).ConvertedOpportunityId;
                   comTemp.contact__c = smap.get(comtemp.Lead__c).ConvertedContactId; 
                   Com.add(comTemp); 
             }
          } if(Com!=null)  
            update Com; 
}