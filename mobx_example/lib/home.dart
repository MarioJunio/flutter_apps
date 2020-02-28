import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/controller.dart';

class Home extends StatelessWidget {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MobX"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            onChanged: controller.changeFirstValue,
            decoration: InputDecoration(labelText: "Primeiro valor"),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: controller.changeSecondValue,
            decoration: InputDecoration(labelText: "Segundo valor"),
          ),
          Divider(
            color: Colors.transparent,
          ),
          SizedBox(
            width: double.infinity,
            child: Observer(
              builder: (_) {
                return Text(
                  controller.sum.toString(),
                  style: TextStyle(fontSize: 60),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
