import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/app/modules/apresentation/apresentation_module.dart';
import 'package:loja_virtual/app/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'apresentation_controller.g.dart';

class ApresentationController = _ApresentationControllerBase
    with _$ApresentationController;

abstract class _ApresentationControllerBase with Store {
  FirestoreService firestoreService =
      ApresentationModule.to.getDependency<FirestoreService>();

  Future<QuerySnapshot> get images => firestoreService.all("home");
}
