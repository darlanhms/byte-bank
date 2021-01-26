import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

Future<int> saveContact(Contact contact) async {
  final Database db = await getDatabase();

  return db.insert("contacts", contact.toJSON(true));
}

Future<List<Contact>> findAllContacts() async {
  final Database db = await getDatabase();

  final List<Map<String, dynamic>> maps = await db.query('contacts');

  final List<Contact> contacts = List();

  maps.forEach((element) {
    contacts.add(Contact.fromJSON(element, true));
  });

  return contacts;
}
