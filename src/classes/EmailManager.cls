public class EmailManager {
    public static void sendEmail(string address, string subject, string body){
        Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
        string[] toAddress= new String[] {address};
        mail.setToAddresses(toAddress);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        Messaging.SendEmailResult[] results= Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        inspectResults(results);
    }
    
    private static boolean inspectResults (Messaging.SendEmailResult[] results){
        boolean sendresult= true;
        for(messaging.SendEmailResult res: results){
            if(res.isSuccess())
                system.debug('Email Sent Successfully');
            else
            {
                sendresult= false;
                system.debug('The following error occured:'+ res.getErrors());
                
            }
        }
        
        return sendresult;
    }
}