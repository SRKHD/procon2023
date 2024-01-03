import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../../interface/firebase_storage/storage_datasource.dart';

class FirebaseStorageDataSourceImpl implements IFirebaseStorageDataSource {
  @override
  Future<void> addFile(String storagePath, String filePath) async {
    final imageFile = File(filePath);
    FirebaseStorage storage = FirebaseStorage.instance;
    try {
      storage.ref(storagePath).putFile(imageFile);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<String> getURL(String storagePath) {
    final Reference ref = FirebaseStorage.instance.ref().child(storagePath);
    return ref.getDownloadURL();
  }
}
