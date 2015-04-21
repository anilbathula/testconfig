Public Class lComments{
    public lead l {get;set;}
    public list<Comments__c> listCom{get; set;}  
    public Comments__c com{get;set;}   
    public Boolean property {get; set;}
    public Boolean showblock{get;set;}
    public Boolean hidebutton{get;set;} 
    public String SelId { get; set; }   
    public String delid{get;set;} 
    id str{get;set;}      
    public map<id,comments__c> mpid{get;set;}  
    public list<leadHistory> listHistory{get;set;}
    Public Boolean hideblock{get;set;}
    

    public LComments(ApexPages.StandardController controller) {   
        l=(Lead)controller.getRecord();
        str=Apexpages.currentpage().getparameters().get('id');  
        property=false;       
        hidebutton=true; 
        hideblock=true;
        listHistory=[select Leadid,createdDate,Field,oldvalue,NewValue from LeadHistory Where CreatedDate>=:System.today() AND LeadID=:str];
        com=new Comments__c();  
        mpid= new map<id,comments__c>(); 
        loaddata();         
         
           
    }
    public void loaddata(){
        if(str==null){
         ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,'There is no lead Record'));
        }
        else{
           listCom=[select id,name,lead__c
                              ,Contact__c
                              ,Opportunity__c                              
                              ,Comments_text__c
                              ,lead__r.Name                       
                              ,Role__c 
                              ,CreatedDate 
                              ,Owner.Name
                              ,Comment_Created_from__c
                               from comments__c 
                               where lead__c=:str order by CreatedDate desc limit 1000];
                               system.debug('asd:->'+str);
                              
          for(comments__c c:listCom){                          
               mpid.put(c.id,c);                                   
          }
      }                                           
    }
    
 /*Method for Clicking new button*/ 
    public Comments__c custNew(){   
    com=new comments__c(); 
        property=true;
        hidebutton=false;  
        hideblock=false;     
        return null;     
    }
 /*Method for Clicking Save button*/
    public void custSave(){    
    com.Lead__c=str;    
    System.debug('ASD'+com.Lead__c);
    property=False; 
    hidebutton=true; 
        if(Com.Comments_text__c!=null){   
          upsert com;  
          loaddata();
        } 
        else{
         ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,'Record not saved because of no comment text'));
        }  
                
    loaddata();
     
    }
 /*Method for Clicking Edit button*/ 
    Public void custEdit(){         
        Property=true;
        hideblock=true;
        hidebutton=false;        
        if(mpid.containsKey(SelId)){                   
           com=mpid.get(SelId);       
        }             
    }  
 /*Method for Clicking Delete button*/
     public void custDel(){
       listCom=[select id from comments__c where id=:delid];
       if(listcom.size()>0){
           delete listCom;
       }
       hideButton=true;
       property=False;
       loaddata();       
    }  
 /*Method for Clicking Cancel button*/
    Public Void CustCancel(){ 
    Property=False;
    hidebutton=false;  
    hidebutton=true; 
      loaddata(); 
    }
 
}