// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
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

  final _$uploadImageAsyncAction = AsyncAction('uploadImage');

  @override
  Future<dynamic> uploadImage(File image) {
    return _$uploadImageAsyncAction.run(() => super.uploadImage(image));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic listenMessages() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.listenMessages();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic sendMessage(String text, Function onSuccess) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.sendMessage(text, onSuccess);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendImage(String url, dynamic onSucess) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.sendImage(url, onSucess);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _addMessage(Message message) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super._addMessage(message);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'messages: ${messages.toString()},isTyping: ${isTyping.toString()}';
    return '{$string}';
  }
}
