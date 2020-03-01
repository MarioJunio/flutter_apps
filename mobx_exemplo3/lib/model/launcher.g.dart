// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launcher.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Launcher on _LauncherBase, Store {
  final _$idAtom = Atom(name: '_LauncherBase.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_LauncherBase.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$observationAtom = Atom(name: '_LauncherBase.observation');

  @override
  String get observation {
    _$observationAtom.context.enforceReadPolicy(_$observationAtom);
    _$observationAtom.reportObserved();
    return super.observation;
  }

  @override
  set observation(String value) {
    _$observationAtom.context.conditionallyRunInAction(() {
      super.observation = value;
      _$observationAtom.reportChanged();
    }, _$observationAtom, name: '${_$observationAtom.name}_set');
  }

  final _$priceAtom = Atom(name: '_LauncherBase.price');

  @override
  double get price {
    _$priceAtom.context.enforceReadPolicy(_$priceAtom);
    _$priceAtom.reportObserved();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.context.conditionallyRunInAction(() {
      super.price = value;
      _$priceAtom.reportChanged();
    }, _$priceAtom, name: '${_$priceAtom.name}_set');
  }

  final _$dateAtom = Atom(name: '_LauncherBase.date');

  @override
  DateTime get date {
    _$dateAtom.context.enforceReadPolicy(_$dateAtom);
    _$dateAtom.reportObserved();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.context.conditionallyRunInAction(() {
      super.date = value;
      _$dateAtom.reportChanged();
    }, _$dateAtom, name: '${_$dateAtom.name}_set');
  }

  final _$typeAtom = Atom(name: '_LauncherBase.type');

  @override
  LauncherType get type {
    _$typeAtom.context.enforceReadPolicy(_$typeAtom);
    _$typeAtom.reportObserved();
    return super.type;
  }

  @override
  set type(LauncherType value) {
    _$typeAtom.context.conditionallyRunInAction(() {
      super.type = value;
      _$typeAtom.reportChanged();
    }, _$typeAtom, name: '${_$typeAtom.name}_set');
  }

  final _$statusAtom = Atom(name: '_LauncherBase.status');

  @override
  LauncherStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(LauncherStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$_LauncherBaseActionController =
      ActionController(name: '_LauncherBase');

  @override
  dynamic setId(int id) {
    final _$actionInfo = _$_LauncherBaseActionController.startAction();
    try {
      return super.setId(id);
    } finally {
      _$_LauncherBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String description) {
    final _$actionInfo = _$_LauncherBaseActionController.startAction();
    try {
      return super.setDescription(description);
    } finally {
      _$_LauncherBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObservation(String observation) {
    final _$actionInfo = _$_LauncherBaseActionController.startAction();
    try {
      return super.setObservation(observation);
    } finally {
      _$_LauncherBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPrice(double price) {
    final _$actionInfo = _$_LauncherBaseActionController.startAction();
    try {
      return super.setPrice(price);
    } finally {
      _$_LauncherBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDate(DateTime date) {
    final _$actionInfo = _$_LauncherBaseActionController.startAction();
    try {
      return super.setDate(date);
    } finally {
      _$_LauncherBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setType(LauncherType type) {
    final _$actionInfo = _$_LauncherBaseActionController.startAction();
    try {
      return super.setType(type);
    } finally {
      _$_LauncherBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatus(LauncherStatus status) {
    final _$actionInfo = _$_LauncherBaseActionController.startAction();
    try {
      return super.setStatus(status);
    } finally {
      _$_LauncherBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},description: ${description.toString()},observation: ${observation.toString()},price: ${price.toString()},date: ${date.toString()},type: ${type.toString()},status: ${status.toString()}';
    return '{$string}';
  }
}
