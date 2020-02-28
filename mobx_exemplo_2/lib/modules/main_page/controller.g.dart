// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on _ControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$nameRequiredMessageAtom =
      Atom(name: '_ControllerBase.nameRequiredMessage');

  @override
  String get nameRequiredMessage {
    _$nameRequiredMessageAtom.context
        .enforceReadPolicy(_$nameRequiredMessageAtom);
    _$nameRequiredMessageAtom.reportObserved();
    return super.nameRequiredMessage;
  }

  @override
  set nameRequiredMessage(String value) {
    _$nameRequiredMessageAtom.context.conditionallyRunInAction(() {
      super.nameRequiredMessage = value;
      _$nameRequiredMessageAtom.reportChanged();
    }, _$nameRequiredMessageAtom,
        name: '${_$nameRequiredMessageAtom.name}_set');
  }

  final _$emailRequiredMessageAtom =
      Atom(name: '_ControllerBase.emailRequiredMessage');

  @override
  String get emailRequiredMessage {
    _$emailRequiredMessageAtom.context
        .enforceReadPolicy(_$emailRequiredMessageAtom);
    _$emailRequiredMessageAtom.reportObserved();
    return super.emailRequiredMessage;
  }

  @override
  set emailRequiredMessage(String value) {
    _$emailRequiredMessageAtom.context.conditionallyRunInAction(() {
      super.emailRequiredMessage = value;
      _$emailRequiredMessageAtom.reportChanged();
    }, _$emailRequiredMessageAtom,
        name: '${_$emailRequiredMessageAtom.name}_set');
  }

  final _$cpfRequiredMessageAtom =
      Atom(name: '_ControllerBase.cpfRequiredMessage');

  @override
  String get cpfRequiredMessage {
    _$cpfRequiredMessageAtom.context
        .enforceReadPolicy(_$cpfRequiredMessageAtom);
    _$cpfRequiredMessageAtom.reportObserved();
    return super.cpfRequiredMessage;
  }

  @override
  set cpfRequiredMessage(String value) {
    _$cpfRequiredMessageAtom.context.conditionallyRunInAction(() {
      super.cpfRequiredMessage = value;
      _$cpfRequiredMessageAtom.reportChanged();
    }, _$cpfRequiredMessageAtom, name: '${_$cpfRequiredMessageAtom.name}_set');
  }

  final _$dirtyAtom = Atom(name: '_ControllerBase.dirty');

  @override
  bool get dirty {
    _$dirtyAtom.context.enforceReadPolicy(_$dirtyAtom);
    _$dirtyAtom.reportObserved();
    return super.dirty;
  }

  @override
  set dirty(bool value) {
    _$dirtyAtom.context.conditionallyRunInAction(() {
      super.dirty = value;
      _$dirtyAtom.reportChanged();
    }, _$dirtyAtom, name: '${_$dirtyAtom.name}_set');
  }

  final _$_ControllerBaseActionController =
      ActionController(name: '_ControllerBase');

  @override
  dynamic nameValidator() {
    final _$actionInfo = _$_ControllerBaseActionController.startAction();
    try {
      return super.nameValidator();
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic emailValidator() {
    final _$actionInfo = _$_ControllerBaseActionController.startAction();
    try {
      return super.emailValidator();
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cpfValidator() {
    final _$actionInfo = _$_ControllerBaseActionController.startAction();
    try {
      return super.cpfValidator();
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDirty() {
    final _$actionInfo = _$_ControllerBaseActionController.startAction();
    try {
      return super.setDirty();
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nameRequiredMessage: ${nameRequiredMessage.toString()},emailRequiredMessage: ${emailRequiredMessage.toString()},cpfRequiredMessage: ${cpfRequiredMessage.toString()},dirty: ${dirty.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
