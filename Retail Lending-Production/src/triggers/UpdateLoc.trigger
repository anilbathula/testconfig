trigger UpdateLoc on Projects__c (before insert,before update) {
    Set<Id> sobjectSetOfIds = new Set<Id>();

    Projects__c prj;
    Property__c prop;   
        
    for(Projects__c pr:trigger.New){
        prj=pr;    
        if(prj.Property__c!=null){
            sobjectSetOfIds.add(prj.Property__c);
        }
    }   
    
    Map<Id,Property__c>smap= new Map<Id, Property__c>([Select id,Builder_Name__c,Builder_Name__r.id,Property_City__c,Location__c,Location__r.id,
                Property_Subtype__c,Property_Type__c
                from Property__c where Id in : sobjectSetOfIds]);
                
    for(Projects__c s: trigger.new){
        if(smap.containsKey(s.Property__c)){
            s.City_of_Project__c=smap.get(s.Property__c).Property_City__c;
            s.Location__c=smap.get(s.Property__c).Location__r.id;
            s.Builder_Name__c=smap.get(s.Property__c).Builder_Name__r.id;     
            s.Property_Subtype__c=smap.get(s.Property__c).Property_Subtype__c;
            s.Property_Type__c=smap.get(s.Property__c).Property_Type__c;    
        }
    }       
}