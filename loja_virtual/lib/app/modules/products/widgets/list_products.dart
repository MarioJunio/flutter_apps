import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatefulWidget {
  final Future<QuerySnapshot> snapshot;

  const ListProducts({Key key, this.snapshot}) : super(key: key);

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
      itemBuilder: _buildListItem,
      itemCount: snapshot.data.documents.length,
    );
  }

  Widget _buildListItem(_, int index) {}
}
