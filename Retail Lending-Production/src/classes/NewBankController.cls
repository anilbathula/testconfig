public class NewBankController {

   /* public List<Bank_Rates__c> brSearchOutput { get; set; }
    public List<Bank_Rates__c> brEmailSearchOutput { get; set; }
    public Bank_Rates__c bank {get; set;}
    String leadId;
    public String[] inputBanks;
    public Lead thisLead{get; set;}
    public DisplaySearch displayOptions {get; set;} 
    Datetime dt = system.today();
    string dtFrmt = dt.format('dd MMM yyyy');
     
    //Email variables
    
    public String subject{ get; set; }
    public String emailBody { get; set; }
    private String myErrMessage;
    private String fileName='';
    

    public NewBankController(){
        bank = new Bank_Rates__c();       
        displayOptions = new DisplaySearch(); 
        leadId = ApexPages.currentPage().getParameters().get('leadId');
        setSearchResults();
    }
    
    public Bank_Rates__c getBank() {
        if(bank == null) bank = new Bank_Rates__c();
        return bank;    
    }
    
    // Method used to fetch search results of the given query      
    public PageReference search(){       
        searchOutput();          
        return Page.NextStep;
    }
    
    public void setSearchResults(){
        leadId = ApexPages.currentPage().getParameters().get('leadId');
        thisLead=[Select id, Email, Name, Property_use__c, Employment__c, Product_Name__c, City_of_work__c,
            City_of_property__c, Residency_Status__c, Loan_Requested_SAL__c, Company_type__c, Loan_Tenure_Requested__c,                                                                             
            Depriciation_co_y1__c, Gross_Profit_co_y1__c, itr_co_y1__c, Prop_total_Cost__c, Prop_Const_Stage__c,
            Prop_Purchase_from__c, Prop_Purchase_Through__c, Prop_Location__c, Prop_occupancy__c, Prop_Age__c,
            type_of_industry__c, Salary_gross__c, Banking_individual__c, Bank_company__c,
            Rented_to1__c, Lessee_name1__c, Lease_amount1__c, Lease_Term__c, Lease_due_term1__c, Prop_Type__c        
            from lead where 
            id=:leadId];                   
            setSearchInput(thisLead);
 
    }
    
    public void setSearchInput(Lead thisLead){
        bank.Product_Name__c = thisLead.Product_Name__c; 
        bank.Property_use__c = thisLead.Property_use__c; 
        bank.City_of_work__c = thisLead.City_of_work__c; 
        bank.City_of_property__c = thisLead.City_of_property__c; 
        bank.Residency_Status__c = thisLead.Residency_Status__c; 
        bank.Company_type__c = thisLead.Company_type__c;         
        bank.Loan_Requested_SAL__c = thisLead.Loan_Requested_SAL__c;  
        bank.Loan_Tenure_Requested__c = thisLead.Loan_Tenure_Requested__c;
        bank.type_of_industry__c = thisLead.type_of_industry__c; 
        bank.Salary_gross__c = thisLead.Salary_gross__c;
        bank.Banking_individual__c= thisLead.Banking_individual__c;  
        bank.Bank_company__c = thisLead.Bank_company__c; 
        bank.Employment__c = thisLead.Employment__c;         
        bank.itr_co_y1__c = thisLead.itr_co_y1__c;
        bank.Depriciation_co_y1__c = thisLead.Depriciation_co_y1__c;
        bank.Gross_Profit_co_y1__c = thisLead.Gross_Profit_co_y1__c;
        bank.Prop_Type__c = thisLead.Prop_Type__c;
        bank.Prop_total_Cost__c = thisLead.Prop_total_Cost__c;
        bank.Prop_Const_Stage__c = thisLead.Prop_Const_Stage__c;
        bank.Prop_Purchase_from__c = thisLead.Prop_Purchase_from__c;
        bank.Prop_Purchase_Through__c = thisLead.Prop_Purchase_Through__c;
        bank.Prop_Location__c = thisLead.Prop_Location__c;             
        bank.Prop_occupancy__c = thisLead.Prop_occupancy__c;
        bank.Prop_Age__c = thisLead.Prop_Age__c;
        bank.Rented_to1__c = thisLead.Rented_to1__c;
        bank.Lessee_name1__c = thisLead.Lessee_name1__c;
        bank.Lease_amount1__c = thisLead.Lease_amount1__c;
        bank.Lease_Term__c = thisLead.Lease_Term__c;
        bank.Lease_due_term1__c = thisLead.Lease_due_term1__c;
    }     
    
    public void searchOutput(){
        String[] inputtypeOfLoan;
        String[] inputBanks;
        if(bank.Type_of_Loan__c!=null)
            inputtypeOfLoan=bank.Type_of_Loan__c.Split(';');  
           
        if(bank.Banks_list__c!=null)       
            inputBanks = bank.Banks_list__c.Split(';');
            
        fileName = thisLead.Name + '-' + dtFrmt + '';
            subject ='VirtualRealty: Proposal for Loan--Rs : '+thisLead.Loan_Requested_SAL__c;
            emailBody = 'Dear ' + thisLead.Name + ',\n\n' +
                        'Please find enclosed our proposal for your kind perusal.' + '\n' +
                        'Do let us know if you require any further information or assistance in this context,' + '\n' +
                        'we would be more than happy to be at your service' + '\n\n\n' +
                        'Yours truly, \n'+ UserInfo.getName();      
            
                
        brSearchOutput =  [ Select id, Name, Max_Loan_Amount__c, Min_Loan_Amount__c, Max_Tenure__c,
            Min_Tenure__c, Type_of_Loan__c, Employment__c, Slab_Rates__c, ADF__c, Bank_Name__c, Product_Name__c,
            ANCIL_CHG__c, Base_Rate__c, Franking_Fee__c, Funding_Upto__c, Mort__c,Teaser_Fixed__c,
            Insurance__c, P__c, PreClosure__c, Proc_Fee_incl_tax__c, Project_Approved__c, Prop_Type__c,
            Rate_Std__c, Rate_OD_Loan__c, Bank_Selection__c, Display_Banks__c            
            from Bank_Rates__c            
            where      
            ((Max_Loan_Amount__c>=:bank.Loan_Requested_SAL__c 
            or Min_Loan_Amount__c<=:bank.Loan_Requested_SAL__c )
            and Type_of_Loan__c in :inputtypeOfLoan 
            and Bank_Name__c  in :inputBanks )
            and ((Employment__c in  (:bank.Employment__c)) 
            or (Employment__c='General'))];
    } 
    
    public PageReference emailStep(){
        setEmailDataTable();    
        return Page.AnilTest;    
       
    }
    
    public void setEmailDataTable(){
        brEmailSearchOutput = new List<Bank_Rates__c>();
        for(Bank_Rates__c br:brSearchOutput)
            if(br.Bank_Selection__c==true){
                brEmailSearchOutput.add(br);
            }  
    }
        
     //function used to send the proposal email
    public PageReference send() {
        
        // Define the email  
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();         
        // Reference the attachment page and pass in the Meeting Fee ID
        PageReference pdf =  Page.SearchCriteriaProposal;
        pdf.getParameters().put('leadId',thisLead.Id);
        pdf.setRedirect(true);
        
        // Take the PDF content
        Blob b ;
        try {
            b= pdf.getContent();
        }catch(VisualforceException e){
            b=Blob.valueOf('Error occured while Generating PDF');
        
        }
        // Create the email attachment
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName(fileName);
        efa.setBody(b);
        efa.setInline(false);
        efa.setContentType('application/pdf');
        // Sets the paramaters of the email  
        String addresses;
        if (thisLead.Email != null){
            addresses = thisLead.Email ;        
        }
        
        String []toAddresses = addresses.split(':', 0);
        email.setSubject(subject);
        email.setToAddresses(toAddresses);
        email.setPlainTextBody(emailBody);
        email.setUseSignature(false);
        email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
        
        // Sends the email  
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});   
        
        // create the attachment against the quote 
        Attachment a = new Attachment(parentId = thisLead.id, name=thisLead.Name + '.pdf', body = b);
          
        // insert the attachment 
        insert a;        
        return new PageReference('/'+thisLead.Id);
    }   */
    
    //Test Method for New Bank Controller 
   /* public static testMethod void testNewBankController(){
        Profile p = [select id from profile where name='System Administrator'];
        User u = new User(alias = 'rii1', email='standarduser@testorg.com',        
        emailencodingkey='UTF-8', lastname='RII', languagelocalekey='en_US',
        localesidkey='en_US', profileid = p.Id,timezonesidkey='America/Los_Angeles', username='rixyncsindiainc@testorg.com');
        insert u;  
        
      
        Lead l= new Lead(FirstName='test',LastName='test',Status='open',Street='rajajiNagar',
            Phone='9036543016',Residency_Status__c='india',Email='abc@gmail.com');
        insert l; 
        Bank_Rates__c br= new Bank_Rates__c(Name='test', Banks_list__c='HDFC', 
        Loan_Requested_SAL__c=100, Employment__c='General', Bank_Name__c='HDFC', Type_of_Loan__c='Regular Fixed');
        insert br;
        ApexPages.currentPage().getParameters().put('leadId', l.id);
        
        NewBankController nc = new NewBankController();
        nc.bank = br;    
        Test.setCurrentPageReference(new PageReference('Page.myPageName')); 
        PageReference Search = new PageReference('/apex/NextStep');
        PageReference emailStep = new PageReference('/apex/AnilTest');
        nc.search();
        nc.getBank();
        nc.emailStep();
        nc.send();
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        email.subject = 'Test Job Applicant';
        email.fromname = 'FirstName LastName';
     
    
       

       
    }     */
 }