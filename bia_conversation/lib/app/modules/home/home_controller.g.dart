// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<int> _$countMessagesComputed;

  @override
  int get countMessages =>
      (_$countMessagesComputed ??= Computed<int>(() => super.countMessages))
          .value;

  final _$messagesAtom = Atom(name: '_HomeControllerBase.messages');

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.context.enforceReadPolicy(_$messagesAtom);
    _$messagesAtom.reportObserved();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.context.conditionallyRunInAction(() {
      super.messages = value;
      _$messagesAtom.reportChanged();
    }, _$messagesAtom, name: '${_$messagesAtom.name}_set');
  }

  final _$isSpeechingAtom = Atom(name: '_HomeControllerBase.isSpeeching');

  @override
  bool get isSpeeching {
    _$isSpeechingAtom.context.enforceReadPolicy(_$isSpeechingAtom);
    _$isSpeechingAtom.reportObserved();
    return super.isSpeeching;
  }

  @override
  set isSpeeching(bool value) {
    _$isSpeechingAtom.context.conditionallyRunInAction(() {
      super.isSpeeching = value;
      _$isSpeechingAtom.reportChanged();
    }, _$isSpeechingAtom, name: '${_$isSpeechingAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic clearMessages() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.clearMessages();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addMessage(Message message) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.addMessage(message);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Message getMessage(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.getMessage(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSpeechStatus(bool isListening) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changeSpeechStatus(isListening);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'messages: ${messages.toString()},isSpeeching: ${isSpeeching.toString()},countMessages: ${countMessages.toString()}';
    return '{$string}';
  }
}
