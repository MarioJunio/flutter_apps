import 'package:bloc_exemplo1/app/app_controller.dart';
import 'package:bloc_exemplo1/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:bloc_exemplo1/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AppController controller = AppModule.to.getBloc<AppController>();

    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeModule(),
    );
  }
}
