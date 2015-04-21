public class Disbursements{

    Id oppnId;
    public List<Disbursement__c> disb {get;set;}  
    Decimal cumDisb  {get;set;}
    Decimal  total {get;set;}
    
    public Disbursements() {        
        oppnId = ApexPages.currentPage().getParameters().get('OppnId');
        disb= [Select id, Requested_Amount__c, Amount_paid_by_Customer__c, 
                Amount_paid_by_Bank__c, Total_Disbursement__c, Total_Amount1__c,
                Disb_by_Customer_till_date__c ,Disbursement_by_bank__c,Total_Disbursment__c,
                Payment_Schedule__c, Cumulative_Disbursement__c 
                from Disbursement__c                
                where Opportunity__c=:oppnId]; 
    }
    public PageReference ammendDisb(){
        cumDisb =0;
        total=0;
        for(Disbursement__c d: disb){
            //write logics for disb
       
          cumDisb = cumDisb + d.Total_Disbursement__c;
          d.Cumulative_Disbursement__c = cumDisb;
        
          total=cumDisb*2;     
          d.Total_Amount1__c =total;       
        }
        update disb;        
        PageReference page = new PageReference('/apex/DisbursementVF?OppnId='+oppnId);     
        return page;          
    }  
    public PageReference cancel() {
        return new PageReference('/'+ApexPages.currentPage().getParameters().get('OppnId'));
    }
  public static testMethod void testDisbursemnts(){
        Account a= new Account(Name='Res');
        insert a;
        
        /*Opportunity o=new Opportunity(Name='test',  CloseDate=System.Today(),
        AccountId=a.id,StageName='Disbursed');
        insert o;*/
  
      
      Disbursements dbs=new Disbursements();
      
          dbs.ammendDisb();
         // Disbursement__c disb=new Disbursement__c();
          // disb.Cumulative_Disbursement__c;
          dbs.cancel();
          
  }  
}