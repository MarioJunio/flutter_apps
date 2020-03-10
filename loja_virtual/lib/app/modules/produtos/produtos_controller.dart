import 'package:loja_virtual/app/modules/produtos/produtos_module.dart';
import 'package:mobx/mobx.dart';

import '../../services/firestore_service.dart';

part 'produtos_controller.g.dart';

class ProdutosController = _ProdutosControllerBase with _$ProdutosController;

abstract class _ProdutosControllerBase with Store {
  final FirestoreService firestoreService = ProdutosModule.to.getDependency();

  get products => firestoreService.getProducts();
}
