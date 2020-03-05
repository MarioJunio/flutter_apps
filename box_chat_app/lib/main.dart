import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:box_chat_app/app/app_module.dart';

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();

  Firestore.instance.collection("messages").snapshots().listen((data) {
    data.documentChanges.forEach((DocumentChange document) => print(document.document.data));
  });*/

  runApp(AppModule());
}
