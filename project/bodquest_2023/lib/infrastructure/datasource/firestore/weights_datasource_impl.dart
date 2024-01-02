import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/firestore/weight/fug_get_weights_response.dart';
import '../../model/firestore/weight/fug_weight.dart';
import 'weights_datasource.dart';

class FirestoreWeightsDataSourceImpl implements IFirestoreWeightsDataSource {
  @override
  Stream<FugGetWeightsResponse> get(String userId) {
    return FirebaseFirestore.instance
        .collection('weights')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((value) => FugGetWeightsResponse(results: [
              ...value.docs.map((doc) => FugWeight.fromJson(doc.id, doc.data()))
            ]));
  }

  @override
  Future<int> add(String userId, DateTime date, double value) async {
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

  @override
  Future<int> delete(String userId, String id) {
    FirebaseFirestore.instance
        .collection('weights') // コレクションID
        .doc(id)
        .delete(); // ドキュメントID
    return Future.value(0);
  }

  @override
  Future<int> update(String userId, String id, DateTime date, double value) {
    FirebaseFirestore.instance
        .collection('weights') // コレクションID
        .doc(id) // ドキュメントID
        .update({
      'userId': userId,
      'date': Timestamp.fromDate(date),
      'value': value,
    }); // データ
    return Future.value(0);
  }
}
