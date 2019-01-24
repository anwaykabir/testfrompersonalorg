public class ContactsListController {
    private String sortOrder = 'LastName';
    public list<contact> getContacts(){        
        List<Contact> ContactList= Database.query('SELECT ID, FIRSTNAME, LASTNAME, EMAIL FROM CONTACT ORDER BY '+ sortOrder +' ASC');
        return ContactList;
    }
    public void sortByLastName(){
        this.sortOrder='LastName';
        system.debug('Insite sortByLastName');
    }
    public void sortByFirstName(){
        this.sortOrder='FirstName';
        system.debug('Insite sortByFirstName');
    }

}