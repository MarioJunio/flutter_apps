import 'package:loja_virtual/app/modules/products/products_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/products/products_page.dart';

class ProductsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ProductsController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ProductsPage();

  static Inject get to => Inject<ProductsModule>.of();
}
