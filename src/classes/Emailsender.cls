public class Emailsender {
    public static void sendEmail(string[] toAddresses, string[] ccAddresses, string subject, string body) {
      	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(toAddresses);
        mail.setCcAddresses(ccAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
		    mail.setHtmlBody(body);
        


        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }	
}