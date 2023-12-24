import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/firestore/training/fug_get_trainings_response.dart';
import '../../model/firestore/training/fug_training.dart';
import 'trainings_datasource.dart';

class FirestoreTrainingsDataSourceImpl
    implements IFirestoreTrainingsDataSource {
  @override
  Stream<FugGetTrainingsResponse> getTrainings(String userId) {
    return FirebaseFirestore.instance
        .collection('trainings')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => FugGetTrainingsResponse(results: [
              ...value.docs.map((doc) => FugTraining.fromJson(doc.data()))
            ]));
  }

  @override
  Future<int> addTraining(
      String userId, String kind, DateTime date, int value) async {
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
}
