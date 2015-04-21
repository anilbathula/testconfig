trigger Unit_name_on_ctct on Unit__c (after insert,after update,after delete) {
  
Set<Id> uids = new Set<Id>(); 
set<Id> updtids = new Set<Id>(); 
Set<Id> dids = new Set<Id>();
Set<Id> tdids=new set<Id>();

/*******insert code*********/
    if(Trigger.isInsert){
        Map<Unit__c,String> varmap=new Map<Unit__c,String>();
        for(unit__c u:trigger.new){
            if(u.Unit_Owner__c!=null){        
                uIds.add(u.Unit_Owner__c);
                varmap.put(u,u.Unit_Owner__c);
            }
        }
        if(!uids.ISEmpty()){
            List<Contact> updtcon=new List<Contact>();
            List<Contact> conlst=[Select Id,name,Property__c,Project_owner__c,Unit_Owner__c From Contact where Id In:uids ];
            for(Contact c:conlst){
                String Project='';
                String Property='';
                String Unit='';
                System.debug('---------->'+varmap.values());
                for(Unit__c u:varmap.Keyset()){
                    if(u.Unit_Owner__c==c.id){
                        if(property==null || property==''){
                            property=u.property_Name__c;
                            //System.debug('----&&&>'+property);
                        }
                        else{
                            Property+=','+u.property_Name__c;
                        }
                        
                        if(project==null || project==''){
                            project=u.Project_Name_f__c;
                        }
                        else{
                            project+=','+u.Project_Name_f__c;
                        }
                        
                        if(Unit==null || Unit==''){
                            Unit=u.Name;
                        }
                        else{
                            Unit+=','+u.Name;
                        }
                    }
                }
                
                if((property!=null||property!='') && (c.Property__c==null||c.Property__c=='')){
                    c.Property__c=property;
                }
                else if(property!=null||property!=''){
                    c.Property__c+=','+property;
                }
                if((project!=null||project!='') && (c.Project_Owner__c==null||c.Project_Owner__c=='')){
                    c.Project_Owner__c=project;
                }
                else if(property!=null||property!=''){
                    c.Project_Owner__c+=','+project;
                }
                if((unit!=null||unit!='') && (c.Unit_Owner__c==null||c.Unit_Owner__c=='')){
                    c.Unit_Owner__c=unit;
                }
                else if(unit!=null || unit!=''){
                    c.Unit_Owner__c+=','+unit;
                }
                updtcon.add(c);
                System.debug(c.id+'================'+c.Property__c+'=========================='+c.Project_Owner__c+'==============='+updtcon);
            }
            update updtcon;
        } 
           
    }
   /********update Code*********/
  
   if(Trigger.IsUpdate &&Trigger.isAfter){
        Map<Unit__c,String> varmap1=new Map<Unit__c,String>();
        for(unit__c u:trigger.New){
            if(Trigger.oldMap.get(u.id).unit_owner__c!=Trigger.NewMap.get(u.id).unit_owner__c  ){
                varmap1.put(u,u.Unit_Owner__c);
                updtIds.add(u.Unit_Owner__c);
            }
        } 
        if(!updtIds.ISEmpty()){
            List<Contact> updtcons=new List<Contact>();
            List<Contact> conlst=[Select Id,name,Property__c,Project_owner__c,Unit_Owner__c From Contact where Id In:updtIds];
            for(Contact c:conlst){
                String Project='';
                String Property='';
                String Unit='';
                //System.debug('================'+varmap.values());
                for(Unit__c u:varmap1.keyset()){
                    if(u.Unit_Owner__c==c.id){
                        if(property==null || property==''){
                            property=u.property_Name__c;
                            System.debug('----&&&>'+property);
                        }
                        else{
                            Property+=','+u.property_Name__c;
                        }
                        if(project==null || project==''){
                            project=u.Project_Name_f__c;
                        }
                        else{
                            project+=','+u.Project_Name_f__c;
                        }
                        if(Unit==null || Unit==''){
                            Unit=u.Name;
                        }
                        else{
                            Unit+=','+u.Name;
                        }
                    }
                }
               if((property!=null||property!='') && (c.Property__c==null||c.Property__c=='')){
                    c.Property__c=property;
                }
                else if(property!=null||property!=''){
                    c.Property__c+=','+property;
                }
                if((project!=null||project!='') && (c.Project_Owner__c==null||c.Project_Owner__c=='')){
                    c.Project_Owner__c=project;
                }
                else if(property!=null||property!=''){
                    c.Project_Owner__c+=','+project;
                }
                if((unit!=null||unit!='') && (c.Unit_Owner__c==null||c.Unit_Owner__c=='')){
                    c.Unit_Owner__c=unit;
                }
                else if(unit!=null || unit!=''){
                    c.Unit_Owner__c+=','+unit;
                }
                updtcons.add(c);      
                System.debug('**********'+updtcons);      
            }  
            update updtcons;
        }
    String str,str1,str2;
     Map<Unit__c,String> varmap2=new Map<Unit__c,String>();
     for(unit__c u:trigger.old){
     System.debug(dIds+'}}}}}==&'+u); 
         if(Trigger.oldMap.get(u.id).unit_owner__c!=Null&&Trigger.oldMap.get(u.id).unit_owner__c!=Trigger.NewMap.get(u.id).unit_owner__c){               
             tdids.add(Trigger.oldMap.get(u.id).unit_owner__c);
             varmap2.put(u,Trigger.oldMap.get(u.id).unit_owner__c);
             System.debug(dIds+'}}}}}==>'+varmap2.size());         
        }
    }    
    if(!Varmap2.ISEmpty()){
        List<Contact> updtcon1=new List<Contact>();
        List<Contact> conlst=[Select Id,name,Unit_Owner__c,Property__c,Project_Owner__c,(Select id,name,Property_Name__c,Project_Name_f__c,Project_Name__c,Project_Name__r.Name,Property__c,Property__r.Name,Unit_Owner__c from units__r order by Property__r.Name ) From Contact where Unit_Owner__c!=Null AND Id In: tdids ];
        if(!conlst.IsEmpty()){
        for(Contact c:conlst){           
            for(unit__c ud:varmap2.Keyset()){
                    if(ud.Unit_Owner__c==c.id){
                    if(c.Unit_Owner__c.contains(ud.Name)){
                        system.debug('-----------'+str);
                           String strs =c.Unit_Owner__c;  
                           if(strs.contains(','+str)){                
                               c.Unit_Owner__c=strs.remove(','+ud.Name);
                                System.debug('----&&&90>'+c.Unit_Owner__c); 
                           }else if(strs.contains(ud.Name+',')){
                                c.Unit_Owner__c=strs.remove(ud.Name+',');
                                System.debug('----&&&91>'+c.Unit_Owner__c); 
                           }else{
                               c.Unit_Owner__c=strs.remove(ud.Name); 
                               System.debug('----&&&92>'+c.Unit_Owner__c);                       
                           }
                    }
                    if(c.Property__c!=Null && c.Property__c.contains(ud.Property_Name__c)){
                        system.debug('-----------'+ud.Property_Name__c);
                           String strs1 =c.Property__c;  
                            if(strs1.contains(','+ud.Property_Name__c)){                  
                               c.Property__c=strs1.remove(','+ud.Property_Name__c);          
                                System.debug('----&&&99>'+c.Property__c);             
                            }else if(strs1.contains(ud.Property_Name__c+',')){
                                c.Property__c=strs1.remove(ud.Property_Name__c+',');
                                System.debug('----&&&97>'+c.Property__c);  
                            }else{
                                c.Property__c=strs1.remove(ud.Property_Name__c); 
                                 System.debug('----&&&98>'+c.Property__c);                         
                            }
                    }
                    if(c.Project_Owner__c!=null && c.Project_Owner__c.contains(ud.Project_Name_f__c)){
                        system.debug('-----------'+str2);
                           String strs2 =c.Project_Owner__c; 
                            if(strs2.contains(','+ud.Project_Name_f__c)){                
                               c.Project_Owner__c=strs2.remove(','+ud.Project_Name_f__c);
                            }else if(strs2.contains(str2+',')){
                                c.Project_Owner__c=strs2.remove(ud.Project_Name_f__c+',');
                            }else{
                                c.Project_Owner__c=strs2.remove(ud.Project_Name_f__c);
                            }
                    }
                   
                 } 
             }
             updtcon1.add(c); 
        } 
        update updtcon1;         
      }        
    }    
  }
   

///delete code
   if(Trigger.IsDelete&&Trigger.IsAfter){
     String str,str1,str2;
     Map<Unit__c,String> varmap3=new Map<Unit__c,String>();
     for(unit__c u:trigger.old){
     System.debug(dIds+'}}}}}==&'+u); 
         if(Trigger.oldMap.get(u.id).unit_owner__c!=Null){               
             dIds.add(u.Unit_Owner__c);
             varmap3.put(u,u.Unit_Owner__c);
            // System.debug(dIds+'}}}}}==>'+varmap.size());         
        }
    }    
    if(!Varmap3.ISEmpty()){
        List<Contact> updtcon1=new List<Contact>();
        List<Contact> conlst=[Select Id,name,Unit_Owner__c,Property__c,Project_Owner__c,(Select id,name,Property_Name__c,Project_Name_f__c,Project_Name__c,Project_Name__r.Name,Property__c,Property__r.Name,Unit_Owner__c from units__r order by Property__r.Name ) From Contact where Unit_Owner__c!=Null AND Id In: dIds ];
        if(!conlst.IsEmpty()){
        for(Contact c:conlst){           
            for(unit__c ud:varmap3.Keyset()){
                    if(ud.Unit_Owner__c==c.id){
                    if(c.Unit_Owner__c.contains(ud.Name)){
                        system.debug('-----------'+str);
                           String strs =c.Unit_Owner__c;  
                           if(strs.contains(','+str)){                
                               c.Unit_Owner__c=strs.remove(','+ud.Name);
                                System.debug('----&&&90>'+c.Unit_Owner__c); 
                           }else if(strs.contains(ud.Name+',')){
                                c.Unit_Owner__c=strs.remove(ud.Name+',');
                                System.debug('----&&&91>'+c.Unit_Owner__c); 
                           }else{
                               c.Unit_Owner__c=strs.remove(ud.Name); 
                               System.debug('----&&&92>'+c.Unit_Owner__c);                       
                           }
                    }
                    if(c.Property__c!=Null && c.Property__c.contains(ud.Property_Name__c)){
                        system.debug('-----------'+ud.Property_Name__c);
                           String strs1 =c.Property__c;  
                            if(strs1.contains(','+ud.Property_Name__c)){                  
                               c.Property__c=strs1.remove(','+ud.Property_Name__c);          
                                System.debug('----&&&99>'+c.Property__c);             
                            }else if(strs1.contains(ud.Property_Name__c+',')){
                                c.Property__c=strs1.remove(ud.Property_Name__c+',');
                                System.debug('----&&&97>'+c.Property__c);  
                            }else{
                                c.Property__c=strs1.remove(ud.Property_Name__c); 
                                 System.debug('----&&&98>'+c.Property__c);                         
                            }
                    }
                    if(c.Project_Owner__c!=null && c.Project_Owner__c.contains(ud.Project_Name_f__c)){
                        system.debug('-----------'+str2);
                           String strs2 =c.Project_Owner__c; 
                            if(strs2.contains(','+ud.Project_Name_f__c)){                
                               c.Project_Owner__c=strs2.remove(','+ud.Project_Name_f__c);
                            }else if(strs2.contains(str2+',')){
                                c.Project_Owner__c=strs2.remove(ud.Project_Name_f__c+',');
                            }else{
                                c.Project_Owner__c=strs2.remove(ud.Project_Name_f__c);
                            }
                    }
                   
                 } 
             }
             updtcon1.add(c); 
        } 
        update updtcon1;         
      }        
    }    
  }
  
}