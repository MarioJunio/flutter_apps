import 'dart:io';

import 'package:agenda_contatos/repository/contact-repository.dart';
import 'package:agenda_contatos/ui/contact_page.dart';
import 'package:flutter/material.dart';

import '../model/contact.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ContactRepository contactRepository = ContactRepository();
  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();

    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus contatos"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: listItemContatos,
        itemCount: contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: addContact,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget listItemContatos(context, index) {
    final Contact item = contacts[index];

    final picture = item.picture != null
        ? FileImage(File(item.picture))
        : AssetImage("images/person.png");

    return GestureDetector(
      onTap: () {
        _openPageContact(contact: item);
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: picture)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(item.email, style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        item.phone,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _load() {
    contactRepository.all().then((values) {
      setState(() {
        contacts = values;
      });
    });
  }

  _openPageContact({Contact contact}) async {
    final resultContact = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(
          contact: contact,
        ),
      ),
    );

    print(resultContact);

    if (resultContact != null) {
      if (contact == null)
        contactRepository.save(contact);
      else
        contactRepository.edit(contact);

      _load();
    }
  }

  void addContact() {
    _openPageContact();
  }
}
