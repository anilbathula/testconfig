@isTest
public class lcomments_Test{
    public static testmethod void methodname(){
        
       
       
        Lead led = new Lead();
        led.Company = 'Company';
        led.FirstName = 'FirstName';
        led.LastName = 'LastName';
        led.Status='Open';
        led.Email = 'lead11123@testmail.com';
        led.MobilePhone='+91-(0)-9874506789';
        insert led;
        
        Id currleadid=led.id;      
        
        Comments__c c=new Comments__c();        
        c.Lead__c=led.id;
        insert c;
        
        
        PageReference pageRef = Page.leadcomments;
        Test.setCurrentPage(pageRef);
        Apexpages.currentPage().getparameters().put('id',led.id);
        
        ApexPages.StandardController ctrlr=new ApexPages.StandardController(led);
        lcomments ld=new lcomments(ctrlr);
        ld.CustNew();
        ld.CustSave();
        ld.CustEdit();
        ld.custDel();
        ld.CustCancel();        
      
    }
}