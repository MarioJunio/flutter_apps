import 'package:box_chat_app/app/modules/home/components/chat_message.dart';
import 'package:box_chat_app/app/modules/home/components/text_composer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          title: Text("Minhas conversas"),
          centerTitle: true,
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 5,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[ChatMessage(isLeft: false,), ChatMessage(isLeft: true,)],
              ),
            ),
            Container(
              color: Theme.of(context).cardColor,
              child: TextComposer(),
            ),
          ],
        ),
      ),
    );
  }
}
