@IsTest

//Test Class for Commission_Setting__c
private class Stage2Disbursed_Test {
    
    static testMethod void stage2(){
        Profile p = [select id from profile where name='System Administrator'];
        User u = new User(alias = 'rii1', email='standarduser@testorg.com',        
        emailencodingkey='UTF-8', lastname='RII', languagelocalekey='en_US',
        localesidkey='en_US', profileid = p.Id,timezonesidkey='America/Los_Angeles', username='rixyncsindiainc@testorg.com');
        insert u;  
        
        System.runas(u){
            Account a= new Account(Name='test');
            insert a;
            
            Contact c=New contact();
            c.firstname='asret';
            c.lastname='rest';
            c.accountid=a.id;
            insert c;
                
            Opportunity opp= new Opportunity(Name='Jjjjjjj',AccountId=a.id,CloseDate=System.today(),
                StageName='Agreed to Disburse',Borrower__c=c.id);
            insert opp;         
            
            
            Loans__c l=New loans__c();
            l.name='Test';
            l.opportunity__c=opp.id;
            l.Approval_Status__c='Agreed to Disburse';
            l.Borrower__c=c.id;      
            insert l;
            
            opp.stagename='Disbursed';
            update opp;
            
            Bank_Approached__c ba=new Bank_Approached__c();
            ba.Approval_Status__c='Agreed to Disburse';
            ba.loan__c=l.id;
            ba.Opportunity__c=opp.id;
            insert ba;          
            
          
            }
       
   } 
           
        
}