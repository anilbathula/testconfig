/**********************************************
Trigger Name:-Taskowneremail
Test Name   :-Taskowneremail_test
Purpose     :-To send email to sukyana kumar 
              when a task is completed.
**********************************************/


trigger Taskowneremail on Task (after update) { 

Set<Id> sobjectSetOfIds = new Set<Id>();
    for(Task tk:trigger.New){          
   String s;
        String idss=tk.whoid;
        if(idss!=null&&idss.startswith('00Q')){
    lead l=[select id,Name from lead where id=:tk.whoid limit 1];
            s='Lead Name :'+l.name;
        }else{
    contact c=[select id,name from contact where id=:tk.whoid limit 1];
            s='Contact Name :'+c.name;
        }
    
    
    
        if(tk.whoid!=null&&tk.status=='Completed'&&trigger.oldmap.get(tk.id).status!=trigger.newmap.get(tk.id).status){
        
            try{ 
                   String fullRecordURL = URL.getSalesforceBaseUrl().toExternalForm() + '/' + tk.Id;    
                        messaging.Singleemailmessage mail=new messaging.Singleemailmessage();       
                        String Subject='Task has Been completed';
                        String emailBody = 'The task which was been assigned to me has been completed.'+ '\n\n' +                                        
                                        'Details of the task are:'+'-'+'\n\n'+
                                        'Subject  :'+tk.Subject+'\n'+
                                        'Task Assigned to  :'+tk.This_TASK_is_For__c+'\n'+                                        
                                        'Due Date   :'+tk.ActivityDate+'\n'+
                                        'Date Completed   :'+System.Today()+'\n'+
                                        'Comments   :'+tk.Description+'\n'+                                    
                                         s+'\n'+                                        
                                        'Task Record Link :'+fullRecordURL+'\n\n\n';  
                                                                        
                                          
                                         
                        mail.setSenderDisplayName('Retail Lending CRM');     
                        mail.setSubject(subject);
                        mail.setPlainTextBody(emailBody);   
                        mail.setToAddresses(new list<String>{'sukanya.kumar@retaillending.com'});                       
                        mail.saveAsActivity = false; 
                       
                        try{ 
                            messaging.sendEmail(new messaging.Singleemailmessage[]{mail}); 
                        }catch(DMLException e){ 
                            system.debug('ERROR SENDING FIRST EMAIL:'+e.getDMLMessage(0)); 
                        } 
                    }catch(Exception Ex){     
                      trigger.new[0].addError('Errors occured: '+Ex);     
                      system.debug(Ex); 
                    } 
           
        }
    }
  }