import 'dart:io';

import 'package:box_chat_app/app/app_module.dart';
import 'package:box_chat_app/app/model/message.dart';
import 'package:box_chat_app/app/services/firebase_storage_service.dart';
import 'package:box_chat_app/app/services/firestore_service.dart';
import 'package:box_chat_app/app/services/login_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final LoginService loginService = AppModule.to.getDependency<LoginService>();

  final firestoreService = AppModule.to.getDependency<FirestoreService>();

  final firebaseStorageService =
      AppModule.to.getDependency<FirebaseStorageService>();

  @observable
  ObservableList<Message> messages = <Message>[].asObservable();

  @observable
  bool isTyping = false;

  @action
  listenMessages() {
    firestoreService.listenCollectionChanges("messages", (DocumentChange dc) {
      Message message = Message.fromMap(dc.document.data);
      message.setId(dc.document.documentID);

      _addMessage(message);
    });
  }

  @action
  setIsTyping(String text) => isTyping = text.length > 0;

  @action
  sendMessage(String text, Function onSuccess) {
    final Message message = _buildMessage();

    if (message != null) {
      message.setMessageType(MessageType.TEXT);
      message.setText(text);

      _sendMessage(message).then((_) {
        onSuccess();
      });
    } else {
      print("Mensagem nao enviada, pois o usuario nao está autenticado!");
    }
  }

  @action
  sendImage(String url, onSucess) {
    final Message message = _buildMessage();

    if (message != null) {
      message.setMessageType(MessageType.IMAGE);
      message.setText(url);

      _sendMessage(message).then((_) {
        onSucess();
      });
    } else {
      print("Imagem nao enviada, pois o usuario nao está autenticado!");
    }
  }

  @action
  Future uploadImage(File image) async {
    return firebaseStorageService.uploadImage(
        loginService.googleSignIn.currentUser.id.toString() +
            "_" +
            DateTime.now().millisecondsSinceEpoch.toString(),
        image);
  }

  @action
  void _addMessage(Message message) {
    messages.insert(0, message);
  }

  Message _buildMessage() {
    final GoogleSignInAccount account = loginService.googleSignIn.currentUser;

    if (account != null) {
      return Message(
          fromId: account.id,
          from: account.displayName,
          photoUrl: account.photoUrl);
    }

    return null;
  }

  Future<DocumentReference> _sendMessage(Message message) {
    return firestoreService.sendMessage("messages", message);
  }
}
