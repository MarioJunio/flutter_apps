// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  Computed<double> _$sumComputed;

  @override
  double get sum => (_$sumComputed ??= Computed<double>(() => super.sum)).value;

  final _$_sumAtom = Atom(name: 'ControllerBase._sum');

  @override
  int get _sum {
    _$_sumAtom.context.enforceReadPolicy(_$_sumAtom);
    _$_sumAtom.reportObserved();
    return super._sum;
  }

  @override
  set _sum(int value) {
    _$_sumAtom.context.conditionallyRunInAction(() {
      super._sum = value;
      _$_sumAtom.reportChanged();
    }, _$_sumAtom, name: '${_$_sumAtom.name}_set');
  }

  final _$firstValueAtom = Atom(name: 'ControllerBase.firstValue');

  @override
  double get firstValue {
    _$firstValueAtom.context.enforceReadPolicy(_$firstValueAtom);
    _$firstValueAtom.reportObserved();
    return super.firstValue;
  }

  @override
  set firstValue(double value) {
    _$firstValueAtom.context.conditionallyRunInAction(() {
      super.firstValue = value;
      _$firstValueAtom.reportChanged();
    }, _$firstValueAtom, name: '${_$firstValueAtom.name}_set');
  }

  final _$secondValueAtom = Atom(name: 'ControllerBase.secondValue');

  @override
  double get secondValue {
    _$secondValueAtom.context.enforceReadPolicy(_$secondValueAtom);
    _$secondValueAtom.reportObserved();
    return super.secondValue;
  }

  @override
  set secondValue(double value) {
    _$secondValueAtom.context.conditionallyRunInAction(() {
      super.secondValue = value;
      _$secondValueAtom.reportChanged();
    }, _$secondValueAtom, name: '${_$secondValueAtom.name}_set');
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic changeFirstValue(String text) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.changeFirstValue(text);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSecondValue(String text) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.changeSecondValue(text);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'firstValue: ${firstValue.toString()},secondValue: ${secondValue.toString()},sum: ${sum.toString()}';
    return '{$string}';
  }
}
