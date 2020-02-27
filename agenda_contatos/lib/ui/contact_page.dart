import 'dart:io';

import 'package:flutter/material.dart';

import '../model/contact.dart';

class ContactPage extends StatefulWidget {
  Contact contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Contact _contact;
  bool _edited = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    _contact = widget.contact ?? Contact();

    nameController.text = _contact.name;
    emailController.text = _contact.email;
    phoneController.text = _contact.phone;
  }

  _changeEdited(text) {
    _edited = true;
  }

  @override
  Widget build(BuildContext context) {
    final picture = _contact.picture != null
        ? FileImage(File(_contact.picture))
        : AssetImage("images/person.png");

    return WillPopScope(
      onWillPop: _canPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_contact.name ?? "Novo contato"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: picture)),
                ),
              ),
              TextField(
                controller: nameController,
                focusNode: nameFocus,
                keyboardType: TextInputType.text,
                onChanged: _changeEdited,
                decoration: InputDecoration(
                    labelText: "Nome", border: OutlineInputBorder()),
              ),
              Divider(color: Colors.transparent),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: _changeEdited,
                decoration: InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
              ),
              Divider(color: Colors.transparent),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                onChanged: _changeEdited,
                decoration: InputDecoration(
                    labelText: "Phone", border: OutlineInputBorder()),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _save,
          backgroundColor: Colors.red,
          child: Icon(Icons.save),
        ),
      ),
    );
  }

  _save() {
    _contact.name = nameController.text;
    _contact.email = emailController.text;
    _contact.phone = phoneController.text;

    if (_contact.name != null && _contact.name.isNotEmpty) {
      Navigator.pop(context, _contact);
    } else {
      FocusScope.of(context).requestFocus(nameFocus);
    }
  }

  Future<bool> _canPop() {
    if (_edited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar alterações?"),
              content: Text("Ao sair as alterações serão perdidas."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sair"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });

      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
