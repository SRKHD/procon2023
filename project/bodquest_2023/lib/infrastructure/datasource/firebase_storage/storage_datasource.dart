abstract interface class IFirebaseStorageDataSource {
  Future<String> getURL(String storagePath);
  Future<void> addFile(String storagePath, String filePath);
}
