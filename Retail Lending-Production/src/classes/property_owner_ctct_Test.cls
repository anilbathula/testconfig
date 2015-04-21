@IsTest
private class property_owner_ctct_Test {
     static testMethod void PropertyName(){
     
     Contact c=new Contact();
     c.Lastname='Anil';
     Insert c;
     
     
     Property__c p=new property__c();
     p.Property_Owner__c=c.id;
     p.name ='test';
     insert p; 
     
     
     Property__c p1=new property__c();
     p1.Property_Owner__c=c.id;
     p1.name ='test1';
     insert p1;     
         
     delete p1;
     delete p;
     }
}