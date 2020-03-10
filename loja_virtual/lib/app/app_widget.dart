import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja virtual do Mario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 211, 118, 130),
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white, fontSize: 22),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        primaryColor: Color(0xFFFFCCBC),
        primaryColorDark: Colors.white,
      ),
      home: HomeModule(),
    );
  }
}
