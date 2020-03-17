import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/shared/models/product.dart';

class ListProducts extends StatefulWidget {
  final Future<QuerySnapshot> snapshot;
  final Function onTapItem;

  const ListProducts({Key key, this.snapshot, this.onTapItem})
      : super(key: key);

  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.snapshot,
        builder: (context, snapshot) => _buildList(snapshot));
  }

  Widget _buildList(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (_, int index) =>
          _buildListItem(snapshot.data.documents[index]),
      itemCount: snapshot.data.documents.length,
    );
  }

  Widget _buildListItem(DocumentSnapshot document) {
    Product product = Product.fromMap(document.documentID, document.data);

    return Container(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          widget.onTapItem(product);
        },
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Image.network(
                  product.images[0],
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
