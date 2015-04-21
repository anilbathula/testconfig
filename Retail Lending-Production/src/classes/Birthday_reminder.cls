global class Birthday_reminder implements Schedulable {
    public static String CRON_EXP = '0 0 15 * * ? *'; // 8am Every Day

    global void execute(SchedulableContext sc) {
        //Send CRB Emails
        Contact [] cons = [SELECT Id,Name,email,Email_Personal__c,MobilePhone,Next_Birthday__c FROM Contact WHERE Next_Birthday__c!=NULL AND Next_Birthday__c=Today];
        System.debug('====>'+cons.size());
        for(Contact con : cons){
            String conId = con.Id;
            String conName = con.name;
            messaging.Singleemailmessage mail=new messaging.Singleemailmessage();            
            mail.setToAddresses(new list<String>{'sukanya.kumar@retaillending.com'});
            mail.setSenderDisplayName('Retail Lending CRM');     
            mail.setSubject('Contact Birthday ');
            mail.setPlainTextBody('Today is the Birthday of :  '+con.Name+'\n'
            +'Email :'+con.email+'\n'+
            +'Personal Email :'+con.Email_Personal__c+'\n'+
            +'Mobile :'+con.MobilePhone+'\n'+
            'Lets convey our greetings to'+'"'+con.Name+'"'+' on behalf of Retail Lending.');                         
            try{ 
                messaging.sendEmail(new messaging.Singleemailmessage[]{mail}); 
            }catch(DMLException e){ 
                system.debug('ERROR SENDING FIRST EMAIL:'+e.getDMLMessage(0)); 
            } 
        }
    }
}