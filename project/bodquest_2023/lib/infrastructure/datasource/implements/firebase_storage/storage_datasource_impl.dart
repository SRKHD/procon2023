import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import '../../interface/firebase_storage/storage_datasource.dart';

class FirebaseStorageDataSourceImpl implements IFirebaseStorageDataSource {
  @override
  Future<String> addFile(String storagePath, Uint8List? imageData) async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child(storagePath);
    final uploadTask = imageRef.putData(
      imageData!,
      SettableMetadata(
        contentType: 'application/octet-stream', // 一般的なバイナリデータとして
      ),
    );

    return (await uploadTask).ref.getDownloadURL();
    /*  
    //final imageFile = File(filePath);
    FirebaseStorage storage = FirebaseStorage.instance;
    try {
      return storage
          .ref(storagePath)
          .putData(imageData!)
          .then((snapshot) => snapshot.ref.getDownloadURL());
    } catch (e) {
      print(e);
    }
    */
    return Future.value('');
  }

  @override
  Future<String> getURL(String storagePath) {
    if (storagePath == '') return Future.value('');

    final Reference ref = FirebaseStorage.instance.ref().child(storagePath);
    return ref.getDownloadURL();
  }
}
