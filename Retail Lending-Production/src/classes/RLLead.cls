public class RLLead{
    public Lead ld {get; set;}
    
    public RLLead(ApexPages.StandardController controller) {
        ld = (Lead)controller.getRecord();
       // System.debug('PN:'+ld.Product_Name__c);
       
    }

//Test Method

    public static testMethod void testRLLead(){
    Profile p = [select id from profile where name='System Administrator'];
    User u = new User(alias = 'rii1', email='standarduser@testorg.com',
            emailencodingkey='UTF-8', lastname='RII', languagelocalekey='en_US',
            localesidkey='en_US', profileid = p.Id,
            timezonesidkey='America/Los_Angeles', username='rixyncsindiainc@testorg.com');
            insert u;          
     Lead l=new Lead();      
    ApexPages.StandardController sc = new ApexPages.standardController(l);
    RLLead myPageCon = new RLLead(sc);
    
    
    }
}