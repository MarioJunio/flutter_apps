import 'package:box_chat_app/app/app_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:box_chat_app/app/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:box_chat_app/app/app_widget.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LoginService()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
