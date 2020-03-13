import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/data_table_source.dart';
import 'package:paginated_data_table_example/usuario.dart';

class MyPaginatedDataTable extends StatefulWidget {
  @override
  _MyPaginatedDataTableState createState() => _MyPaginatedDataTableState();
}

class _MyPaginatedDataTableState extends State<MyPaginatedDataTable> {
  List<String> headers = ["Nome", "Email", "CPF", "Ativo"];
  List<Usuario> usuarios = [
    Usuario(
        nome: "Mario",
        email: "mario.mj.95@gmail.com",
        cpf: "11420237616",
        ativo: true),
    Usuario(
        nome: "Jose Silva",
        email: "jose.silva@gmail.com",
        cpf: "442434324323",
        ativo: false),
    Usuario(
        nome: "Jheime",
        email: "jheimes@gmail.com",
        cpf: "4424234234",
        ativo: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                PaginatedDataTable(
                  rowsPerPage: 2,
                  header: Text("Usuarios"),
                  columns:
                      headers.map((e) => DataColumn(label: Text(e))).toList(),
                  source: MyDataTableSource(usuarios: usuarios),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            alignment: Alignment.center,
            child: FlatButton(
                onPressed: () {},
                child:
                    Text("Atualizar", style: TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
