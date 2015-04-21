@isTest
private class VRTestClassII {
     static testMethod void UpdateLoc(){
     
        Account a= new Account(Name='Res');
        insert a;
        
        Locations__c l=new Locations__c(Name='indira Nagar');
        insert l;   
        
        Property__c pr=new Property__c(Name='sunil',Builder_Name__c=a.id,Location__c=l.id);         
        insert pr; 
        
        Projects__c p= new Projects__c(Name='Anil',Property__c=pr.id,Builder_Name__c=pr.Builder_Name__r.id,
                      Location__c=pr.Location__r.id);
        insert p;
        
              
         
        
       }
       
        static testMethod void MatchSpouse(){
            
            Account a= new Account(Name='res');
            Insert a;
            
            Contact c= new Contact(LastName='anil');
            insert c;
            
            Contact cs= new Contact(LastName='rajesh',Spouse__c=c.Id);
            insert cs;
          //  c=[select id,Spouse__c from Contact where Id=: c.Spouse__c];
         //    System.assertEquals('Anil', c.Spouse__r.id);
        
        }
}