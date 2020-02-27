import 'dart:io';

import 'package:agenda_contatos/repository/contact-repository.dart';
import 'package:agenda_contatos/ui/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/contact.dart';

enum OrderOptions { asc, desc }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ContactRepository contactRepository = ContactRepository();
  List<Contact> _contacts = List();

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
        actions: <Widget>[
          PopupMenuButton(
              onSelected: _selectAction,
              itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                    PopupMenuItem(
                      child: Text("Ordenar A-Z"),
                      value: OrderOptions.asc,
                    ),
                    PopupMenuItem(
                      child: Text("Ordenar Z-A"),
                      value: OrderOptions.desc,
                    ),
                  ])
        ],
      ),
      body: ListView.builder(
        itemBuilder: listItemContatos,
        itemCount: _contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: addContact,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget listItemContatos(context, index) {
    final Contact item = _contacts[index];

    final picture = item.picture != null
        ? FileImage(File(item.picture))
        : AssetImage("images/person.png");

    return GestureDetector(
      onTap: () {
        _openOptionsOnBottom(index, contact: item);
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
                    image: DecorationImage(image: picture, fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
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
        _contacts = values;
      });
    });
  }

  _openOptionsOnBottom(int index, {Contact contact}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {
                      _callContact(contact.phone);
                    },
                    icon: Icon(Icons.call),
                    label: Text("Ligar"),
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      _openPageContact(contact: contact);
                    },
                    icon: Icon(Icons.edit),
                    label: Text("Editar"),
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      _deleteContact(index, contact.id);
                    },
                    icon: Icon(Icons.delete),
                    label: Text("Excluir"),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  void addContact() {
    _openPageContact();
  }

  _callContact(String phone) {
    launch("tel:$phone");
    Navigator.pop(context);
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

    if (resultContact != null) {
      if (contact == null)
        contactRepository.save(resultContact);
      else
        contactRepository.edit(resultContact);

      _load();
    }
  }

  _deleteContact(int index, int id) async {
    await contactRepository.delete(id);

    setState(() {
      _contacts.removeAt(index);
      Navigator.pop(context);
    });
  }

  void _selectAction(OrderOptions value) {
    switch (value) {
      case OrderOptions.asc:
        _contacts.sort((a, b) => a.name.compareTo(b.name));
        break;
      case OrderOptions.desc:
        _contacts.sort((a, b) => b.name.compareTo(a.name));
    }

    setState(() {});
  }
}
