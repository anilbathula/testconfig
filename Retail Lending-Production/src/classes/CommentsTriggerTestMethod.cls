@isTest
private class CommentsTriggerTestMethod {
/*--------------Test Method For Commentsonconvert Trigger---------------*/
    static testMethod void Commentsonconvert() {  
    
          
        Lead led = new Lead();
        led.Company = 'Company';
        led.FirstName = 'FirstName';
        led.LastName = 'LastName';
        led.Status='Open';
        led.Email = 'lead11123@testmail.com';
        led.MobilePhone='987456';
        insert led;
        
        
            
        List<Comments__c> c=new List<Comments__c>();{
            Comments__c con =new Comments__c();
           // con.name='Test';
            con.Lead__c=led.id;        
            c.add(con);    
            Comments__c con1 =new Comments__c();
            //con1.name='Test1'; 
            con1.Lead__c=led.id;       
            c.add(con1);
        }insert c;
        
        // convert the lead
        Database.LeadConvert lc =
        new database.LeadConvert();        
        lc.setLeadId(led.Id);        
        LeadStatus convertstatus = [select Id, MasterLabel from LeadStatus where IsConverted=
        true limit 1];        
        lc.setConvertedStatus(convertStatus.MasterLabel);        
        Database.LeadConvert[] lcArray =
        new Database.LeadConvert[] {lc};        
        Database.LeadConvertResult[] results = Database.convertLead(lcArray);        
        System.assert(results[0].IsSuccess());                    
        
    }
    }