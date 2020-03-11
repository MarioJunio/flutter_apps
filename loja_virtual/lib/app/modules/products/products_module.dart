import 'package:loja_virtual/app/modules/products/products_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/products/products_page.dart';
import 'package:loja_virtual/app/shared/models/category.dart';
import 'package:loja_virtual/app/shared/services/firestore_service.dart';

class ProductsModule extends ModuleWidget {
  final Category category;

  ProductsModule(this.category);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => ProductsController(i.getDependency(), this.category)),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => FirestoreService()),
      ];

  @override
  Widget get view => ProductsPage();

  static Inject get to => Inject<ProductsModule>.of();
}
