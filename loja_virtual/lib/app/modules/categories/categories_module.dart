import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/categories/categories_controller.dart';
import 'package:loja_virtual/app/modules/categories/categories_page.dart';

import '../../services/firestore_service.dart';

class CategoriesModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CategoriesController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => FirestoreService()),
      ];

  @override
  Widget get view => CategoriesPage();

  static Inject get to => Inject<CategoriesModule>.of();
}
