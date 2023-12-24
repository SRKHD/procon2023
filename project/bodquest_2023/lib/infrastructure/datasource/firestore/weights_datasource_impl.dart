import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/firestore/weight/fug_get_weights_response.dart';
import '../../model/firestore/weight/fug_weight.dart';
import 'weights_datasource.dart';

class FirestoreWeightsDataSourceImpl implements IFirestoreWeightsDataSource {
  @override
  Stream<FugGetWeightsResponse> getWeights(String userId) {
    return FirebaseFirestore.instance
        .collection('weights')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => FugGetWeightsResponse(results: [
              ...value.docs.map((doc) => FugWeight.fromJson(doc.data()))
            ]));
  }

  @override
  Future<int> addWeight(String userId, DateTime date, double value) async {
    await FirebaseFirestore.instance
        .collection('weights') // コレクションID
        .doc() // ドキュメントID
        .set({
      'userId': userId,
      'date': Timestamp.fromDate(date),
      'value': value,
    }); // データ
    return 0;
  }
}
