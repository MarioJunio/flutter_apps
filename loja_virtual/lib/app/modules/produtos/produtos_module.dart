import 'package:loja_virtual/app/modules/produtos/produtos_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/produtos/produtos_page.dart';

import '../../services/firestore_service.dart';

class ProdutosModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ProdutosController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => FirestoreService()),
      ];

  @override
  Widget get view => ProdutosPage();

  static Inject get to => Inject<ProdutosModule>.of();
}
