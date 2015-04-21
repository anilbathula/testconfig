@IsTest
private class Unit_name_on_ctct_Test {
     static testMethod void unitName(){
     
     Contact c=new Contact();
     c.Lastname='Anil';
     Insert c;
     
     Contact c1=new Contact();
     c1.Lastname='Anil';
     Insert c1;
     
     
     Property__c p=new property__c();
     p.name ='test';     
     insert p;
     
     Projects__c pj=new Projects__c();
     pj.name='rest';       
     pj.Property__c=p.id;
     insert pj;
     
     Unit__c u=new unit__c();
     u.Project_Name__c=pj.id;
     u.property__c=p.id;
     u.Unit_Owner__c=c.id;
     insert u;
      
     u.Unit_Owner__c=c1.id;
     update u;
     
     delete u;
     }
}