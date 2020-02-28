import 'package:flutter/material.dart';

import 'ui/main_page.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
    theme: ThemeData.light(),
  ));
}
