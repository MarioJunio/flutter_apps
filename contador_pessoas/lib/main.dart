import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _peoples = 0;
  String _infoText = "";

  void changePeoples(int delta) {
    setState(() {
      _peoples += delta;

      if (_peoples > 10) {
        _infoText = "Lotado";
      } else if (_peoples <= 0) {
        _infoText = "Está vázio";
      } else {
        _infoText = "Há vagas";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 9000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas $_peoples",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    onPressed: () {
                      changePeoples(1);
                    },
                    child: Text("+1",
                        style: TextStyle(color: Colors.white, fontSize: 36)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    onPressed: () {
                      changePeoples(-1);
                    },
                    child: Text(
                      "-1",
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                  ),
                )
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
          ],
        )
      ],
    );
  }
}
