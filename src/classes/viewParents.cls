public with sharing class viewParents {
  public String email {get; set;}
  public String password {get; set;}
  public String error { get; private set;}
  public Parent__c[] parents { get; private set;}
  public Child__c child {get; set; }
  public String filterTime {get; set; }
  public Integer debug {get; set; }
  public Boolean displayPayment {get; set;}

  public void signUpForPayment( ) {
    displayPayment = true;
  }

  public void login () {
    Child__c[] children = [select id, name,  Age__c, Email__c, password__c, Candy_perfered__c, Bedtime_perfered__c, Video_Games__c, min_Number_of_Siblings__c, Max_number__c,  transactionInfo__c from Child__c where Email__c = :email];

    if ( children.size() == 1) {
      child = children[0];
    }

    if (child != null && child.password__c.equals(password)) {
      parents = getParents();
    } else {
      error = 'User not found, Password not a match';
    }
  }

  public selectOption[] getBedtimeHours() {
    Integer currentHour = child.Bedtime_perfered__c.hour();
    selectOption[] options = new selectOption[] {};

    for ( Integer i = currentHour - 3; i >= currentHour + 3; i++) {
      options.add(new selectOption(String.valueOf(i), String.valueOf(i)));
    }

    return options;
  }

  public void filter () {
    child.Bedtime_perfered__c = time.newInstance(Integer.valueOf(filterTime), 0, 0, 0);
    parents = getParents();

  }

  private Parent__c[] getParents() {
    debug++;
    return [select id, name, Candy__c, Bedtime__c, Video_Games__c, Siblings__c from Parent__c
      where Bedtime__c >= :child.Bedtime_perfered__c
      and Candy__c = :child.Candy_perfered__c
      and Siblings__c >= :child.min_Number_of_Siblings__c
      and Siblings__c <= :child.Max_number__c
      and Video_Games__c = :child.Video_Games__c
      ];
  }

	public viewParents() {
		debug = 1;
    displayPayment = false;
	}
}