import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_exemplo_2/modules/main_page/controller.dart';
import 'package:mobx_exemplo_2/modules/main_page/main_page.dart';
import 'package:provider/provider.dart';

import 'modules/main_page/main_page.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton(Controller());

  runApp(MaterialApp(
    home: MainPage(),
  ));
}

/**
 * O codigo abaixo não esta sendo utilizando, pois foi substituido pelo provider Get.It
 */
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
