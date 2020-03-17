// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailsController on _ProductDetailsControllerBase, Store {
  final _$sizeAtom = Atom(name: '_ProductDetailsControllerBase.size');

  @override
  String get size {
    _$sizeAtom.context.enforceReadPolicy(_$sizeAtom);
    _$sizeAtom.reportObserved();
    return super.size;
  }

  @override
  set size(String value) {
    _$sizeAtom.context.conditionallyRunInAction(() {
      super.size = value;
      _$sizeAtom.reportChanged();
    }, _$sizeAtom, name: '${_$sizeAtom.name}_set');
  }

  final _$_ProductDetailsControllerBaseActionController =
      ActionController(name: '_ProductDetailsControllerBase');

  @override
  void selectSize(String size) {
    final _$actionInfo =
        _$_ProductDetailsControllerBaseActionController.startAction();
    try {
      return super.selectSize(size);
    } finally {
      _$_ProductDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'size: ${size.toString()}';
    return '{$string}';
  }
}
