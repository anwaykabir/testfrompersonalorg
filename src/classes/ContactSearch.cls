public class ContactSearch {
    public static List<Contact> searchForContacts (String LastName, String PostCode){
        List<Contact> ContactList= new List<Contact>([SELECT ID,NAME FROM CONTACT WHERE lastname=:LastName 
                                                     and MailingPostalCode=: PostCode]);
        
        //system.debug(ContactList);
        return ContactList;
        
    }

}