@isTest
private class VRTestClass {

      static testMethod void b2cLeadConvert() {
        Lead l = new Lead(LastName='Bathula', Status='Followup(FWP)');
        insert l;
        Contact c=New contact();
            c.firstname='asret';
            c.lastname='rest';
            
            insert c;
        
        Opportunity o = new Opportunity(Name='test',StageName='Disbursed',CloseDate=system.Today(),Borrower__c=c.id);
        insert o;
        Co_Applicant__c ca1 = new Co_Applicant__c(Name='Anil Bathula');
        Co_Applicant__c ca2 = new Co_Applicant__c(Name='Raghu');
        ca1.Lead__c = l.id;
        ca1.Opportunity__c=o.id;
        ca2.Opportunity__c=o.id;
        ca2.Lead__c = l.id;
        insert ca1; insert ca2;
        
        // convert the lead
        Database.LeadConvert lc =
        new database.LeadConvert();        
        lc.setLeadId(l.Id);        
        LeadStatus convertstatus = [select Id, MasterLabel from LeadStatus where IsConverted=
        true limit 1];        
        lc.setConvertedStatus(convertStatus.MasterLabel);        
        Database.LeadConvert[] lcArray =
        new Database.LeadConvert[] {lc};        
        Database.LeadConvertResult[] results = Database.convertLead(lcArray);        
        System.assert(results[0].IsSuccess());
                
    
    }
    
    static testMethod void b2bLeadConvert() {
        Lead l = new Lead(LastName='Bathula', Status='Followup(FWP)', Company='RII');
        insert l;
        Co_Applicant__c ca1 = new Co_Applicant__c(Name='Anil Bathula');
        Co_Applicant__c ca2 = new Co_Applicant__c(Name='Raghu');
        ca1.Lead__c = l.id;
        ca2.Lead__c = l.id;
        insert ca1; insert ca2;
        
        // convert the lead
        Database.LeadConvert lc =
        new database.LeadConvert();        
        lc.setLeadId(l.Id);        
        LeadStatus convertstatus = [select Id, MasterLabel from LeadStatus where IsConverted=
        true limit 1];        
        lc.setConvertedStatus(convertStatus.MasterLabel);        
        Database.LeadConvert[] lcArray =
        new Database.LeadConvert[] {lc};        
        Database.LeadConvertResult[] results = Database.convertLead(lcArray);        
        System.assert(results[0].IsSuccess());
                
    
    }
    //test method for Bank/Comission Setting
    static testMethod void Bank() {
        Account a= new Account(Name='test');
        insert a;
        Contact c=New contact();
            c.firstname='asret';
            c.lastname='rest';
            c.accountid=a.id;
            insert c;
        
        Loans__c l =new Loans__c();
        l.Borrower__c=c.id;
        insert l;
        
       
        //Opportunity__c=o.id
        Opportunity o=new Opportunity(Name='test',StageName='Disbursed',CloseDate=System.Today(),
        AccountId=a.id,Loan__c=l.id,borrower__c=c.id);
        Commission_Setting__c cs = new Commission_Setting__c(Name='TestAnil');
        insert cs;
        o.Commission_Setting__c = cs.id;
        insert o;
        
        Bank_Approached__c ba= new Bank_Approached__c(Loan__c=l.id, Opportunity__c=o.id);
        insert ba;
        
        update o;
    }
    
    //test method to update opportunity stage on opportunity from bank approached
    static testMethod void updateOpportunityStage(){
        Account a= new Account(Name='test');
        insert a;
        
        Contact c=New contact();
            c.firstname='asret';
            c.lastname='rest';
            c.accountid=a.id;
            insert c;
        
        Loans__c l =new Loans__c();
        l.Borrower__c=c.id;
        insert l;
        
        Opportunity o=new Opportunity(Name='test',  CloseDate=System.Today(),
        AccountId=a.id, StageName='Dumped',borrower__c=c.id);
        insert o;        
        
        o.StageName = 'Audited Appt';
        update o;
        o.StageName = 'Sourcing';
        update o;
        
        Bank_Approached__c ba= new Bank_Approached__c(Opportunity__c=o.id,Loan__c=l.id,
                Approval_Status__c='Sent to Bank');
        insert ba;        
        
        ba.Approval_Status__c ='Logged';
        update ba;
        ba.Approval_Status__c ='Queries&Discrepancies';
        update ba;        
        ba.Approval_Status__c ='Query Solved';
        update ba;        
        ba.Approval_Status__c ='Awaiting Approval';
        update ba;
        ba.Approval_Status__c ='Credit Approved';
        update ba;
        ba.Approval_Status__c ='Awaiting Legal Doc';
        update ba;
        ba.Approval_Status__c ='Legal Queries';
        update ba;
        ba.Approval_Status__c ='Legal Clearance';
        update ba;
        ba.Approval_Status__c ='Valuation';
        update ba;
        ba.Approval_Status__c ='Doc-Kit Signing';
        update ba;
        ba.Approval_Status__c ='Agreed to Disburse';
        update ba;
        ba.Approval_Status__c ='Awaiting Disbursal';
        update ba;
        ba.Approval_Status__c ='Disbursed';
        update ba;
        
       
        
    }
    
    //test method to create personal financials
    static testMethod void  Createfin () {
       
        lead l= new lead(LastName='test',Email='abc@gmail.com',Status='Open');
        insert l;
        
        Contact c= new Contact(LastName='raghu');
        insert c;
        
        Account a= new Account(Name='Res');
        insert a;
        
     /*   PersonalFinancials__c fin = new PersonalFinancials__c(Name='test',Salary_gross__c=1000.00,
        Banker__c=l.Banker_Individuals__c,Financials_of__c=c.Name);
        insert fin;*/
        
    }
    
    //test method for dibursement trigger
    static testMethod void  Disbursement() { 
        
        Account a= new Account(Name='test');
        insert a;
        Contact c=New contact();
            c.firstname='asret';
            c.lastname='rest';
            c.accountid=a.id;
            insert c;
        
        Loans__c l=new Loans__c();
        l.Borrower__c=c.id;
        insert l;
        
        Opportunity o=new Opportunity(Name='test',  CloseDate=System.Today(),
        AccountId=a.id,Loan__c=l.id,StageName='Disbursed',borrower__c=c.id);
        insert o; 
        
        Bank_Approached__c b= new Bank_Approached__c(Loan__c=l.id, Opportunity__c=o.id,
        Approval_Status__c='disbursed');       
        insert b;  
        
        Disbursement__c d=new Disbursement__c(Opportunity__c=o.id,loan__c=o.loan__c);        
        insert d;
  
    } 
    
    // test method for creating property trigger 
    static testMethod void  CreateProp() {
        lead l= new lead(LastName='test',Email='abc@gmail.com',Status='Open');
        insert l;
        
        Property__c prop=new Property__c(Name='test');
        insert prop;
    }

    //test method for company financials trigger
    static testMethod void  CreateFinancials() {
        lead l= new lead(LastName='test',Email='abc@gmail.com',Status='Open');
        insert l;
        
        Company_Financials__c cfin=new Company_Financials__c(Name='test'); 
        insert cfin;
    }

    // test method for commissions 
    static testMethod void updateCommissionSet() {
    
        Profile p = [select id from profile where name='System Administrator'];
        User u = new User(alias = 'rii1', email='standarduser@testorg.com',
            emailencodingkey='UTF-8', lastname='RII', languagelocalekey='en_US',
            localesidkey='en_US', profileid = p.Id,
            timezonesidkey='America/Los_Angeles', username='rixyncsindiainc@testorg.com');               
            insert u; 
            
        System.runAs(u){
            Commission_Setting__c cs =new Commission_Setting__c(Name='test', Commission_For_User__c=u.id);
            insert cs; 
            
            Commission__c com=new Commission__c(Name='sales',User__c=u.id);        
            insert com;
            
               }
    }
    
    
    static testMethod void commissionUpdate(){
            Commission_Setting__c cs=new Commission_Setting__c(Name='test');            
            insert cs;
     
            
            cs.Achievement__c='Payment on Slab Achievement';
            cs.Commission_paid_on__c='Flat Pay';
            cs.Commission_paid_on_2__c='%ge';
            cs.Commission_based_on__c='Disbursement';
            update cs;
            
            cs.Achievement__c='Payment on Slab Achievement';
            cs.Commission_paid_on__c='Flat Pay';
            cs.Commission_paid_on_2__c='Amount';
            cs.Commission_based_on__c='Disbursement';
            update cs;
            
            cs.Achievement__c='Payment on Slab Achievement';
            cs.Commission_paid_on__c='Flat Pay';
            cs.Commission_paid_on_2__c='Amount';
            cs.Commission_based_on__c='Revenue Generated';
            update cs;
            
            
            cs.Achievement__c='Payment on Slab Achievement';
            cs.Commission_paid_on__c='Flat Pay';
            cs.Commission_paid_on_2__c='%ge';
            cs.Commission_based_on__c='Revenue Generated';
            update cs;
            
            cs.Achievement__c='Payment With in the Slab Range';
            cs.Commission_paid_on__c='Flat Pay';
            cs.Commission_paid_on_2__c='%ge';
            cs.Commission_based_on__c='Disbursement';
            update cs;
            
            cs.Achievement__c='Payment With in the Slab Range';
            cs.Commission_paid_on__c='Flat Pay';
            cs.Commission_paid_on_2__c='Amount';
            cs.Commission_based_on__c='Disbursement';
            cs.Amount_Paid_on_Inc_Ran__c=1;
            update cs;
            
            cs.Achievement__c='Payment With in the Slab Range';
            cs.Commission_paid_on__c='Flat Pay';
            cs.Commission_paid_on_2__c='%ge';
            cs.Commission_based_on__c='Revenue Generated';
            update cs;
            
            cs.Achievement__c='Payment With in the Slab Range';
            cs.Commission_paid_on__c='Flat Pay';
            cs.Commission_paid_on_2__c='Amount';
            cs.Commission_based_on__c='Revenue Generated';
            update cs;
                      
            cs.Achievement__c='Payment on Slab Achievement';
            cs.Commission_paid_on__c='Incremental';
            cs.Commission_paid_on_2__c='%ge';
            cs.Commission_based_on__c='Disbursement';
            update cs;
          
            cs.Achievement__c='Payment on Slab Achievement';
            cs.Commission_paid_on__c='Incremental';
            cs.Commission_paid_on_2__c='Amount';
            cs.Commission_based_on__c='Disbursement';
            update cs;
            
            cs.Achievement__c='Payment on Slab Achievement';
            cs.Commission_paid_on__c='Incremental';
            cs.Commission_paid_on_2__c='Amount';
            cs.Commission_based_on__c='Revenue Generated';
            update cs;
            
            cs.Achievement__c='Payment on Slab Achievement';
            cs.Commission_paid_on__c='Incremental';
            cs.Commission_paid_on_2__c='%ge';
            cs.Commission_based_on__c='Revenue Generated';
            update cs;
            
            
            cs.Achievement__c='Payment With in the Slab Range';
            cs.Commission_paid_on__c='Incremental';
            cs.Commission_paid_on_2__c='%ge';
            cs.Commission_based_on__c='Disbursement';
            update cs;
            
             
            cs.Achievement__c='Payment With in the Slab Range';
            cs.Commission_paid_on__c='Incremental';
            cs.Commission_paid_on_2__c='Amount';
            cs.Commission_based_on__c='Disbursement';
            update cs;
            
            cs.Achievement__c='Payment With in the Slab Range';
            cs.Commission_paid_on__c='Incremental';
            cs.Commission_paid_on_2__c='Amount';
            cs.Commission_based_on__c='Revenue Generated';
            update cs;
            
             
            cs.Achievement__c='Payment With in the Slab Range';
            cs.Commission_paid_on__c='Incremental';
            cs.Commission_paid_on_2__c='%ge';
            cs.Commission_based_on__c='Revenue Generated';
            update cs;
       
     
     }
}