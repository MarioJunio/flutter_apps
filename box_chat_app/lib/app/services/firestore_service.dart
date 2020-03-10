import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:box_chat_app/app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService extends Disposable {
  @override
  void dispose() {}

  void listenCollectionChanges(String name, Function onReceiveChange) {
    Firestore.instance.collection(name).snapshots().listen(
      (data) {
        data.documentChanges.forEach(onReceiveChange);
      },
    );
  }

  Future<DocumentReference> sendMessage(String collection, Message message) {
    return Firestore.instance.collection(collection).add(message.toMap());
  }

}
