import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Firestore firestore = Firestore();

  Future<QuerySnapshot> getHome() =>
      firestore.collection("home").orderBy("pos").getDocuments();

  Future<QuerySnapshot> getCategories() =>
      firestore.collection("produtos").getDocuments();

  Future<QuerySnapshot> getProdutos(String idCategory) => firestore
      .collection("produtos")
      .document(idCategory)
      .collection("items")
      .getDocuments();
}
