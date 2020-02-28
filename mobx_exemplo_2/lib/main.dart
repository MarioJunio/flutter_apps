import 'package:flutter/material.dart';
import 'package:mobx_exemplo_2/modules/main_page/controller.dart';
import 'package:mobx_exemplo_2/modules/main_page/main_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
          dispose: (_, controller) => controller.dispose(),
        )
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
