import "package:flutter/material.dart";
import 'package:share/share.dart';

class GifPage extends StatelessWidget {
  Map _gif;

  GifPage(this._gif);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          _gif["title"],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(_gif["images"]["original"]["url"]);
              }),
        ],
      ),
      body: Center(
        child: Image.network(
          _gif["images"]["original"]["url"],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
