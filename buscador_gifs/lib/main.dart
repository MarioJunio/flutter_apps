import 'package:flutter/material.dart';

import 'ui/main_page.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: MainPage(),
    theme: ThemeData(hintColor: Colors.white, primaryColor: Colors.white),
  ));
}
