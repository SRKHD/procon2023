import 'dart:typed_data';

abstract interface class IFirebaseStorageDataSource {
  Future<String> getURL(String storagePath);
  Future<String> addFile(String storagePath, Uint8List? filePath);
}
