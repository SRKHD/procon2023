import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/firestore/rug_get_weights_response.dart';
import '../model/firestore/rug_weight.dart';
import 'firestore_weights_datasource.dart';

class FirestoreWeightsDataSourceImpl implements IFirestoreWeightsDataSource {
  @override
  Future<RugGetWeightsResponse> getWeights({int results = 10}) async {
    RugGetWeightsResponse result = RugGetWeightsResponse(results: []);
    const userId = 'srkhd.2023@gmail.com';

    await FirebaseFirestore.instance
        .collection('weights')
        .where('userId', isEqualTo: userId)
        .get()
        .then((value) => {
              for (var doc in value.docs)
                {result.results.add(RugWeight.fromJson(doc.data()))}
            });

    return result;
  }
}
