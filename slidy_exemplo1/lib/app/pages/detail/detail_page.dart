import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  int id;

  DetailPage({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produto $id"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Produto 1"),
            Divider(),
            Text("R\$ 5.68"),
          ],
        ),
      ),
    );
  }
}
