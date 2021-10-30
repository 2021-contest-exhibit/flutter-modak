
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository {
  final FirebaseStorage firebaseStorage;

  FirebaseStorageRepository({required this.firebaseStorage});

  Future<String?> uploadImage(String uid, File file) async {
    bool isUpload = await firebaseStorage.ref("profile/$uid.png").putFile(file).then((value) => true).onError((error, stackTrace) => false);
    if (isUpload) {
      return await firebaseStorage.ref("profile/$uid.png").getDownloadURL();
    } else {
      return null;
    }
  }
}