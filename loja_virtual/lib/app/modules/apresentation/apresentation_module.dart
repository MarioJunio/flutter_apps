import 'package:loja_virtual/app/modules/apresentation/apresentation_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/apresentation/apresentation_page.dart';
import 'package:loja_virtual/app/services/firestore_service.dart';

class ApresentationModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ApresentationController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => FirestoreService()),
      ];

  @override
  Widget get view => ApresentationPage();

  static Inject get to => Inject<ApresentationModule>.of();
}
