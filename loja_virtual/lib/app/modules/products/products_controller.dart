import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/app/shared/models/category.dart';
import 'package:loja_virtual/app/shared/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'products_controller.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  final FirestoreService firestoreService;
  final Category category;

  _ProductsControllerBase(this.firestoreService, this.category) {
    print(this.category);
  }

  Future<QuerySnapshot> get products =>
      firestoreService.getProdutos(category.id);
}
