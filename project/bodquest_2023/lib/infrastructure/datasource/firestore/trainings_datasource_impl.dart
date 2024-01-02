import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/firestore/training/fug_get_trainings_response.dart';
import '../../model/firestore/training/fug_training.dart';
import 'trainings_datasource.dart';

class FirestoreTrainingsDataSourceImpl
    implements IFirestoreTrainingsDataSource {
  @override
  Stream<FugGetTrainingsResponse> get(String userId) {
    return FirebaseFirestore.instance
        .collection('trainings')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => FugGetTrainingsResponse(results: [
              ...value.docs
                  .map((doc) => FugTraining.fromJson(doc.id, doc.data()))
            ]));
  }

  @override
  Future<int> add(String userId, String kind, DateTime date, int value) async {
    await FirebaseFirestore.instance
        .collection('trainings') // コレクションID
        .doc() // ドキュメントID
        .set({
      'userId': userId,
      'kind': kind,
      'date': Timestamp.fromDate(date),
      'value': value,
    }); // データ
    return 0;
  }

  @override
  Future<int> delete(String userId, String id) {
    FirebaseFirestore.instance
        .collection('trainings') // コレクションID
        .doc(id)
        .delete(); // ドキュメントID
    return Future.value(0);
  }

  @override
  Future<int> update(
      String userId, String id, String kind, DateTime date, int value) {
    try {
      FirebaseFirestore.instance
          .collection('trainings') // コレクションID
          .doc(id) // ドキュメントID
          .update({
        'userId': userId,
        'kind': kind,
        'date': Timestamp.fromDate(date),
        'value': value,
      }); // データ
    } catch (e) {
      print(e);
    }
    return Future.value(0);
  }
}
