@isTest
private class TriggerTestMethod {

    //test method for Bank
    static testMethod void Bank() {
        Account a= new Account(Name='test');
        insert a;
        Contact c=New contact();
            c.firstname='asret';
            c.lastname='rest';
            c.accountid=a.id;
            insert c;
        
        Loans__c l =new Loans__c();
        l.borrower__c=c.id;
        insert l;
        
        Opportunity o=new Opportunity(Name='test',StageName='Disbursed',CloseDate=System.Today(),
        AccountId=a.id,Loan__c=l.id,borrower__c=c.id);
        insert o;
        
        Bank_Approached__c ba= new Bank_Approached__c(Loan__c=l.id,Opportunity__c=o.id);
        insert ba;
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
        AccountId=a.id, StageName='Sourcing',borrower__c=c.id);
        insert o; 
        // do update field that will make Max_of_Bank_Approval_Status__c as 1, 2,,,, 13
        //o.Max_of_Bank_Approval_Status__c=1;
        update o;      
        
        if(o.Max_of_Bank_Approval_Status__c==2){
            o.StageName='Logged'; 
        }      
        
        update o; 
        o.StageName='Queries&Discrepancies';   
        upsert o; 
        
        o.StageName='Query Solved';
        upsert o; 
        
        o.StageName='Awaiting Approval';         
        upsert o; 
        
        o.StageName='Credit Approved';        
        update o;
        
        o.StageName='Awaiting Legal Doc';    
        update o;
        
        o.StageName='Legal Queries';       
        update o;
        
        o.StageName='Legal Clearance';       
        update o;
        
        o.StageName='Valuation';         
        update o;
        
        o.StageName='Doc-Kit Signing';       
        update o;
        
        o.StageName='Agreed to Disburse';        
        update o;
        
        o.StageName='Awaiting Disbursal';         
        update o;
        Bank_Approached__c ba= new Bank_Approached__c(Opportunity__c=o.id,Loan__c=l.id,
                Approval_Status__c='senttobank');
                insert ba;
                if(ba.Approval_Status__c=='1')
                insert ba;
                update o;
        
    }
    
    //test method to create personal financials
    static testMethod void  Createfin () {
       
        lead l= new lead(LastName='test',Email='abc@gmail.com',Status='Open');
        insert l;
        
        Contact c= new Contact(LastName='raghu');
        insert c;
        
        Account a= new Account(Name='Res');
        insert a;
        
       /* PersonalFinancials__c fin = new PersonalFinancials__c(Name='test',Salary_gross__c=1000.00,
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
        AccountId=a.id,Loan__c=l.id,StageName='Disbursed',borrower__c=c.Id);
        insert o; 
        
        Bank_Approached__c b= new Bank_Approached__c(Loan__c=l.id, Opportunity__c=o.id,
        Approval_Status__c='disbursed');       
        insert b;  
        
        Disbursement__c d=new Disbursement__c(Loan__c=l.id,Opportunity__c=o.id);
        //Loan__c= oppn.Loan__c;
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