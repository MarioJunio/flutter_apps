import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService extends Disposable {
  @override
  void dispose() {}

  Future uploadImage(String imageName, File image) async {
    StorageUploadTask task =
        FirebaseStorage.instance.ref().child(imageName).putFile(image);

    StorageTaskSnapshot taskSnapshot = await task.onComplete;

    return (await taskSnapshot.ref.getDownloadURL());
  }
}
