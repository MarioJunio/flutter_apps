// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_cadastro_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormCadastroItemController on _FormCadastroItemControllerBase, Store {
  final _$titleAtom = Atom(name: '_FormCadastroItemControllerBase.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'title: ${title.toString()}';
    return '{$string}';
  }
}
