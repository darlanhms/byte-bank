import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';

Future<int> saveContact(Contact contact) {
  return createDatabase().then((db) {
    return db.insert("contacts", contact.toJSON(true));
  });
}

Future<List<Contact>> findAllContacts() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = List();

      maps.forEach((element) {
        contacts.add(Contact.fromJSON(element, true));
      });

      return contacts;
    });
  });
}
