import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/firestore/rug_get_weights_response.dart';
import '../model/firestore/rug_weight.dart';
import 'firestore_weights_datasource.dart';

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
  Future<int> addWeight(String userId, double value) async {
    await FirebaseFirestore.instance
        .collection('weights') // コレクションID
        .doc() // ドキュメントID
        .set({'value': value, 'userId': userId}); // データ
    return 0;
  }
}
