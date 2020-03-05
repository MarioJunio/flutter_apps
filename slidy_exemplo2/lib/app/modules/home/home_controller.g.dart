// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$carsAtom = Atom(name: '_HomeControllerBase.cars');

  @override
  ObservableList<dynamic> get cars {
    _$carsAtom.context.enforceReadPolicy(_$carsAtom);
    _$carsAtom.reportObserved();
    return super.cars;
  }

  @override
  set cars(ObservableList<dynamic> value) {
    _$carsAtom.context.conditionallyRunInAction(() {
      super.cars = value;
      _$carsAtom.reportChanged();
    }, _$carsAtom, name: '${_$carsAtom.name}_set');
  }

  final _$_carAtom = Atom(name: '_HomeControllerBase._car');

  @override
  String get _car {
    _$_carAtom.context.enforceReadPolicy(_$_carAtom);
    _$_carAtom.reportObserved();
    return super._car;
  }

  @override
  set _car(String value) {
    _$_carAtom.context.conditionallyRunInAction(() {
      super._car = value;
      _$_carAtom.reportChanged();
    }, _$_carAtom, name: '${_$_carAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setCar(String car) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setCar(car);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.save();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.remove(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'cars: ${cars.toString()}';
    return '{$string}';
  }
}
