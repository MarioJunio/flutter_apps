import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Firestore firestore = Firestore();

  Future<QuerySnapshot> getHome() =>
      firestore.collection("home").orderBy("pos").getDocuments();

  Future<QuerySnapshot> getProducts() =>
      firestore.collection("produtos").getDocuments();
}
