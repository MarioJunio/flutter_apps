import 'package:bloc_exemplo1/app/modules/clientes/clientes_module.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: FlatButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ClientesModule(),
              ),
            );
          },
          icon: Icon(Icons.person),
          label: Text("Clientes"),
        ),
      ),
    );
  }
}
