@isTest
private class Birthday_Reminder_Test{
 static testmethod void Birthday_Reminder() {   
     Test.startTest();
     contact c= new contact();
     c.firstName='zestrt';
     c.lastName='zsert';
     c.birthdate=system.today();
     insert c;

        Birthday_Reminder sh1 = new Birthday_Reminder();      
        String sch = '0 0 23 * * ?';
        system.schedule('Test check',sch,sh1);
     Test.stopTest();
 }
}