import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart';

class FirebaseStorageRepository {
  Future<String> uploadImageToFirebase(String imageName , File imageFile ,String path) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('$path/$imageName');

    UploadTask uploadTask =  ref.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    return imageUrl;
  }

// Future uploadImageToFirebase(File imageFile) async {
//   String fileName = basename(imageFile.path);
//   FirebaseStorage  storage  = FirebaseStorage.instance;
//   Reference ref = storage.ref().child('uploads/$fileName');
//
//   UploadTask uploadTask = ref.putFile(imageFile);
//
//   uploadTask.then((taskSnapshot) {
//     taskSnapshot.ref.getDownloadURL().then(
//           (value) => print("Done: $value"),
//     );
//   });
//
// }

}
