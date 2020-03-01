import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_exemplo3/modules/main_page/main_page_controller.dart';

import 'modules/main_page/main_page.dart';

void main() => initApp();

void initApp() {
  GetIt.I.registerSingleton<MainPageController>(MainPageController());

  return runApp(
    MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    ),
  );
}
