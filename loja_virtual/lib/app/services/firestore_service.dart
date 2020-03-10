import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Firestore firestore = Firestore();

  Future<QuerySnapshot> all(String collection) {
    return firestore.collection(collection).orderBy("pos").getDocuments();
  }
}
