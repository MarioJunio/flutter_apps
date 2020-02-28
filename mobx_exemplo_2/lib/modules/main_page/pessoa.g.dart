// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Pessoa on _PessoaBase, Store {
  final _$nameAtom = Atom(name: '_PessoaBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$cpfAtom = Atom(name: '_PessoaBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.context.enforceReadPolicy(_$cpfAtom);
    _$cpfAtom.reportObserved();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.context.conditionallyRunInAction(() {
      super.cpf = value;
      _$cpfAtom.reportChanged();
    }, _$cpfAtom, name: '${_$cpfAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_PessoaBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$_PessoaBaseActionController = ActionController(name: '_PessoaBase');

  @override
  dynamic setName(String name) {
    final _$actionInfo = _$_PessoaBaseActionController.startAction();
    try {
      return super.setName(name);
    } finally {
      _$_PessoaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCpf(String cpf) {
    final _$actionInfo = _$_PessoaBaseActionController.startAction();
    try {
      return super.setCpf(cpf);
    } finally {
      _$_PessoaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String email) {
    final _$actionInfo = _$_PessoaBaseActionController.startAction();
    try {
      return super.setEmail(email);
    } finally {
      _$_PessoaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'name: ${name.toString()},cpf: ${cpf.toString()},email: ${email.toString()}';
    return '{$string}';
  }
}
