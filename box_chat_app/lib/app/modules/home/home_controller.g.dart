// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$isTypingAtom = Atom(name: '_HomeControllerBase.isTyping');

  @override
  bool get isTyping {
    _$isTypingAtom.context.enforceReadPolicy(_$isTypingAtom);
    _$isTypingAtom.reportObserved();
    return super.isTyping;
  }

  @override
  set isTyping(bool value) {
    _$isTypingAtom.context.conditionallyRunInAction(() {
      super.isTyping = value;
      _$isTypingAtom.reportChanged();
    }, _$isTypingAtom, name: '${_$isTypingAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setIsTyping(String text) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setIsTyping(text);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'isTyping: ${isTyping.toString()}';
    return '{$string}';
  }
}
