import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  String _car;

  ListItemWidget({String car}) {
    this._car = car;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this._car),
    );
  }
}
