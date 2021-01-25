import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

import 'package:bytebank/components/custom_input.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New contact"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            CustomInput(
              controller: _nameController,
              label: 'Full name',
              textStyle: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: CustomInput(
                controller: _accountNumberController,
                label: 'Account number',
                keyboardType: TextInputType.number,
                hint: "1000",
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: () => handleAddContact(),
                  child: Text("Create"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleAddContact() {
    final String name = _nameController.text;
    final int accountNumber = int.tryParse(_accountNumberController.text);

    final Contact contact = Contact(name: name, accountNumber: accountNumber);

    Navigator.pop(context, contact);
  }
}
