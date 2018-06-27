trigger parents on Parent__c (after insert) {

  if (Trigger.isAfter && Trigger.isInsert) {
    sendWelcomeEmails();
  }
  
  Private String[] toAddresses () {
    String[] addresses = new String[] {};

    for (Parent__c parent: Trigger.new) {
      addresses.add(parent.Email__c);
    }

    return addresses;
  }

  Private void sendWelcomeEmails () {
    Boolean many = Trigger.size == 1 ? false : true;
    String[] toAddresses = toAddresses();
    String body;
    String subject;

    if ( many ) {
      subject = 'Data was submitted';
      body = 'thanks for submitting stuff';
      } else {
      subject = 'thank you ' + Trigger.new[0].name  + '!';
      body = 'thank you for submitting information ' + Trigger.new[0].name + '!!!!';
      }

    Emailsender.sendEmail(toAddresses, null, subject, body);
  }
}