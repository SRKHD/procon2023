import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/firestore/training/rug_get_trainings_response.dart';
import '../../model/firestore/training/rug_training.dart';
import 'trainings_datasource.dart';

class FirestoreTrainingsDataSourceImpl
    implements IFirestoreTrainingsDataSource {
  @override
  Stream<RugGetTrainingsResponse> getTrainings(String userId) {
    return FirebaseFirestore.instance
        .collection('trainings')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => RugGetTrainingsResponse(results: [
              ...value.docs.map((doc) => RugTraining.fromJson(doc.data()))
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
