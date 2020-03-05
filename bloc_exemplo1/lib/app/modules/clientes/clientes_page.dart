import 'package:bloc_exemplo1/app/modules/cadastro_cliente/cadastro_cliente_module.dart';
import 'package:flutter/material.dart';

class ClientesPage extends StatefulWidget {
  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("teste"),
      ),
      body: Container(
        child: FlatButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CadastroClienteModule(),
              ),
            );
          },
          icon: Icon(Icons.add),
          label: Text("Cadastro"),
        ),
      ),
    );
  }
}
