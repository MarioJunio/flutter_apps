import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/shared/models/product.dart';

class GridListProducts extends StatefulWidget {
  final Future<QuerySnapshot> snapshot;

  const GridListProducts({Key key, this.snapshot}) : super(key: key);

  @override
  _GridListProductsState createState() => _GridListProductsState();
}

class _GridListProductsState extends State<GridListProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: FutureBuilder<QuerySnapshot>(
        future: widget.snapshot,
        builder: _buildFuture,
      ),
    );
  }

  Widget _buildFuture(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: snapshot.data.documents.length,
        itemBuilder: (_, int index) =>
            _buildGridItem(snapshot.data.documents[index]));
  }

  Widget _buildGridItem(DocumentSnapshot document) {
    Product product = Product.fromMap(document.documentID, document.data);

    return InkWell(
      child: Card(
        elevation: 1,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(product.images[0], fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Divider(),
              Text(
                "R\$ ${product.price.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
