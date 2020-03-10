import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/home/widgets/custom_drawer.dart';
import 'package:loja_virtual/app/modules/produtos/produtos_controller.dart';
import 'package:loja_virtual/app/modules/produtos/produtos_module.dart';

class ProdutosPage extends StatefulWidget {
  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final ProdutosController controller = ProdutosModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Produtos"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.products,
        builder: _buildListFuture,
      ),
    );
  }

  Widget _buildListFuture(context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData)
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
        ),
      );

    return ListView(
      padding: EdgeInsets.all(5),
      children: _buildDividedList(snapshot.data),
    );
  }

  List<Widget> _buildDividedList(QuerySnapshot snapshot) {
    final tiles = snapshot.documents
        .map((DocumentSnapshot document) => _buildListTile(document))
        .toList();

    return ListTile.divideTiles(
      tiles: tiles,
      color: Colors.grey,
    ).toList();
  }

  Widget _buildListTile(DocumentSnapshot document) => ListTile(
        contentPadding: EdgeInsets.all(15),
        leading: Image.network(
          document.data["icon"],
          height: 50,
        ),
        title: Text(
          document.data["title"],
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 30,
        ),
      );
}
