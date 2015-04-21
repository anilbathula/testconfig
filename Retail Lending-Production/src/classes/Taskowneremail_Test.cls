@isTest
public class Taskowneremail_Test{
    public static testmethod void Taskowneremail(){       
       id ids;
         Profile p = [Select Id from profile WHERE name='System Administrator']; 
         User usr = new User(alias = 'standt', email = 'test@9876test.com', 
                                  emailencodingkey = 'UTF-8', 
                                  lastname = 'TestLasName',
                                  languagelocalekey = 'en_US', 
                                  localesidkey = 'en_US',
                                  timezonesidkey = 'America/Los_Angeles', 
                                  Profileid=p.id, username = 'testUniqudeName@test.com');
                                  insert usr;       
              
                Lead led = new Lead();
                led.Company = 'Company';
                led.FirstName = 'FirstName';
                led.LastName = 'LastName';
                led.Status='Open';
                led.Email = 'lead11123@testmail.com';
                led.MobilePhone='+91-(0)-9874506789';
                insert led;  
                            
                Contact Con = new contact(LastName='Testing1',FirstName='Apex'); 
                insert con; 
                if(led!=null){
                    ids=led.id;
                }else{
                    ids=con.id;
                }
                
                Task testTask = new Task(Subject='AD First Mailing General question +email',Whoid=ids,Ownerid=usr.id,status='In progress');              
                insert testTask; 
                testTask.status='Completed';
                update testTask;       
             
      
    }
}