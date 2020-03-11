import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/shared/models/product.dart';

class GridList extends StatefulWidget {
  final Future<QuerySnapshot> snapshot;

  const GridList({Key key, this.snapshot}) : super(key: key);

  @override
  _GridListState createState() => _GridListState();
}

class _GridListState extends State<GridList> {
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

    return GridTile(
      child: Text(product.description),
    );
  }
}
