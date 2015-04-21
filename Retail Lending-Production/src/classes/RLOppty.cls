public class RLOppty{
    public Opportunity ld {get; set;}
    
    public RLOppty(ApexPages.StandardController controller) {
        ld = (Opportunity)controller.getRecord();
        System.debug('PN:'+ld.Name);
       
    }
//  Test Method
   
    public static testMethod void testCoApplicant(){
    Profile p = [select id from profile where name='System Administrator'];
    User u = new User(alias = 'rii1', email='standarduser@testorg.com',
            emailencodingkey='UTF-8', lastname='RII', languagelocalekey='en_US',
            localesidkey='en_US', profileid = p.Id,
            timezonesidkey='America/Los_Angeles', username='rixyncsindiainc@testorg.com');
            insert u;          
    Opportunity o=new Opportunity();       
    ApexPages.StandardController sc = new ApexPages.standardController(o);
    RLOppty myPageCon = new RLOppty(sc);
}

}