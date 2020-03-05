import 'package:bloc_exemplo1/app/modules/clientes/clientes_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:bloc_exemplo1/app/modules/clientes/clientes_page.dart';

class ClientesModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ClientesController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ClientesPage();

  static Inject get to => Inject<ClientesModule>.of();
}
