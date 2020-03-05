import 'package:flutter/material.dart';
import 'package:box_chat_app/app/modules/home/home_module.dart';

final ThemeData iOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
    textTheme: TextTheme(title: TextStyle(fontSize: 14)));

final ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.teal,
    accentColor: Colors.tealAccent,
    textTheme: TextTheme(
        title: TextStyle(fontSize: 16),
        subhead: TextStyle(color: Colors.black)));

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Box Chat',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).platform == TargetPlatform.iOS
          ? iOSTheme
          : defaultTheme,
      home: HomeModule(),
    );
  }
}
