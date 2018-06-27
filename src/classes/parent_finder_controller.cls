public class parent_finder_controller {
  public Parent__c parent { get; set; }
  public Child__c child { get; set; }
  public String state { get; private set; }
  public String debug { get; private set; }


  public parent_finder_controller() {
    state = 'start';
    debug = 'one';
  }

  public void new_parent() {
    parent = new Parent__c();
    state = 'parent';
    debug = 'two';

  }

  public void new_child() {
    child = new Child__c();
    state = 'child';
  }

  public void insertFormParent() {
    state = 'finished';
    insert parent;
  }

  public void insertFormChild() {
    state = 'finished';
    insert child;
  }

  ////public Parnet__c getParent() {
  ////  return parent;
  ////}
  ////line 2 is doing the same thing as this method. 


}