import 'package:bloc_exemplo1/app/modules/cadastro_cliente/cadastro_cliente_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:bloc_exemplo1/app/modules/cadastro_cliente/cadastro_cliente_page.dart';

class CadastroClienteModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CadastroClienteController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => CadastroClientePage();

  static Inject get to => Inject<CadastroClienteModule>.of();
}
