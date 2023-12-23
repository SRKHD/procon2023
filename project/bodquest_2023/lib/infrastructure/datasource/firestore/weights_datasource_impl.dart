import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/firestore/weight/rug_get_weights_response.dart';
import '../../model/firestore/weight/rug_weight.dart';
import 'weights_datasource.dart';

class FirestoreWeightsDataSourceImpl implements IFirestoreWeightsDataSource {
  @override
  Stream<RugGetWeightsResponse> getWeights(String userId) {
    return FirebaseFirestore.instance
        .collection('weights')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => RugGetWeightsResponse(results: [
              ...value.docs.map((doc) => RugWeight.fromJson(doc.data()))
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