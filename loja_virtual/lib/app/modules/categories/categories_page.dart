import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/categories/categories_controller.dart';
import 'package:loja_virtual/app/modules/categories/categories_module.dart';
import 'package:loja_virtual/app/modules/home/widgets/custom_drawer.dart';
import 'package:loja_virtual/app/modules/products/products_module.dart';
import 'package:loja_virtual/app/shared/models/category.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoriesController controller = CategoriesModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Categorias"),
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
        onTap: () {
          _toProducts(document);
        },
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

  void _toProducts(DocumentSnapshot document) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductsModule(Category.fromMap(document.documentID, document.data))),
    );
  }
}
