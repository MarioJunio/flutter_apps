import 'package:loja_virtual/app/shared/models/product.dart';
import 'package:mobx/mobx.dart';
part 'product_details_controller.g.dart';

class ProductDetailsController = _ProductDetailsControllerBase
    with _$ProductDetailsController;

abstract class _ProductDetailsControllerBase with Store {
  Product product;

  @observable
  String size;

  _ProductDetailsControllerBase({this.product});

  void setCurrentProduct(Product product) {
    this.product = product;
  }

  @action
  void selectSize(String size) => this.size = size;
}
