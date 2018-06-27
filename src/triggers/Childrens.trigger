trigger childerns on Child__c (after insert) {
  if (Trigger.isAfter && Trigger.isInsert) {
    sendWelcomeEmails();
  }

  Private String[] toAddresses() {
    String[] addressess = new String[] {};

    for (Child__C childerns: Tigger.new) {
      addressess.add(childerns.Email__c);
    }

    return addressess;
  }

  Private void sendWelcomeEmails () {
    Boolean many = Trigger.size == 1 ? false : true;
    String[] toAddresses = toAddresses();
    String body;
    String subject;

    if (many) {
      subject = 'Data was Submitted';
      body = 'Thanks for submitting Stuff';
    } else {
      subject = 'Thank you ' + Trigger.new[0].name + '!';
      body = 'Thank you for submitting information ' + Trigger.new[0].name + ' !!!!!';
    }

    Emailsender.sendEmail(toAddresses, null, subject, body);
  }
}
