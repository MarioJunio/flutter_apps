import 'package:loja_virtual/app/modules/categories/categories_module.dart';
import 'package:mobx/mobx.dart';

import '../../services/firestore_service.dart';

part 'categories_controller.g.dart';

class CategoriesController = _CategoriesControllerBase
    with _$CategoriesController;

abstract class _CategoriesControllerBase with Store {
  final FirestoreService firestoreService = CategoriesModule.to.getDependency();

  get products => firestoreService.getProducts();
}
