import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemBuilder: (context, index) => _listItem(index),
          itemCount: 2,
        ),
      ),
    );
  }

  Widget _listItem(int index) {
    return GestureDetector(
      onTap: _goDetail,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Text("Produto 1"), Text("R\$5.34")],
          ),
        ),
      ),
    );
  }

  void _goDetail() {
    Navigator.pushNamed(context, "/detail/189");
  }
}
