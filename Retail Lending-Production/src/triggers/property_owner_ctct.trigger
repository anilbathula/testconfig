trigger property_owner_ctct on Property__c (after insert,after update,after delete) {
Set<Id> uids = new Set<Id>(); 

    if((Trigger.isInsert || Trigger.isUpdate) && Trigger.isAfter){
      
        for(Property__c p:trigger.new){
            if(p.Property_Owner__c!=null){        
                uIds.add(p.Property_Owner__c);
                
            }
     }
    
     if(!uids.ISEmpty()){
        List<Contact> updtcon=new List<Contact>();
        List<Contact> conlst=[Select Id,name,Property__c From Contact where Id In:uids ];
            for(Contact c:conlst){
                String property='';
                
                if(property==null || property==''){
                    property=trigger.new[0].Name;
                }else{
                    Property+=','+trigger.new[0].Name;
                }                
                if(c.Property__c==null||c.Property__c==''){
                    c.Property__c=property;
                    System.debug('---------->'+c.Property__c);
                }else{
                    c.Property__c+=','+property;
                     System.debug('---------->'+c.Property__c);
                }
                updtcon.add(c);
            }update updtcon; 
     }
 }
 
    if(Trigger.Isdelete){
        String str;
        for(Property__c p:trigger.old){
            if(p.Property_Owner__c!=null){        
                uIds.add(p.Property_Owner__c);
                str=p.Name;
            }
         }
    
     if(!uids.ISEmpty()){
        List<Contact> updtcon=new List<Contact>();
        List<Contact> conlst=[Select Id,name,Property__c,(Select id,name from Property__r  ) From Contact where Property__c!=Null AND  Id In:uids ];
           if(!conlst.IsEmpty()){
            for(Contact c:conlst){
                
                if(c.Property__c.contains(str)){
                
                   String strs =c.Property__c;  
                   if(strs.contains(','+str)){                
                       c.Property__c=strs.remove(','+str);
                   }
                   else if(strs.contains(str+',')){                
                       c.Property__c=strs.remove(str+',');
                   }
                   else{
                       c.Property__c=strs.remove(str);
                       
                   }
                }
              
                updtcon.add(c);
                
            }
            }update updtcon; 
     }
}
}