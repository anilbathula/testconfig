@isTest
public class opp_comments_Test{
    public static testmethod void methodname(){    
       
        Account ct = new Account();       
        ct.Name = 'LastName';        
        insert ct;    
        
        Opportunity op=new opportunity();
        op.Name='firstname';
        //op.Contact__c=ct.id;
        op.StageName='Accepted';
        op.CloseDate=System.today();
        insert op;    
        
        Comments__c c=new Comments__c();        
        c.opportunity__c=op.id;
        insert c;
        
        
        PageReference pageRef = Page.Oppcomments;
        Test.setCurrentPage(pageRef);
        Apexpages.currentPage().getparameters().put('id',op.id);
        
        ApexPages.StandardController ctrlr=new ApexPages.StandardController(op);
        opp_comments opp=new opp_comments(ctrlr);
        opp.CustNew();
        opp.CustSave();
        opp.CustEdit();
        opp.custDel();
        opp.CustCancel();        
      
    }
}