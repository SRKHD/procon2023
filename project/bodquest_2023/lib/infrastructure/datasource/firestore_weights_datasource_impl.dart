import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/firestore/rug_get_weights_response.dart';
import '../model/firestore/rug_weight.dart';
import 'firestore_weights_datasource.dart';

class FirestoreWeightsDataSourceImpl implements IFirestoreWeightsDataSource {
  @override
  Future<RugGetWeightsResponse> getWeights({int results = 10}) async {
    const userId = 'srkhd.2023@gmail.com';
    final weightsRef = FirebaseFirestore.instance
        .collection('weights') // コレクションID
        .where('userId', isEqualTo: userId);
    RugGetWeightsResponse result = RugGetWeightsResponse(results: []);
    weightsRef.get().then((snapshot) => {
          snapshot.docs.map((e) => {
                print(e.data()),
                result.results.add(RugWeight.fromJson(e.data()))
              })
          //   if (snapshot.docs.length > 0)
          //     {result = RugGetWeightsResponse.fromJson(docSnapshot.data())}
          //   else
          //     {
          //       throw NetworkException(
          //           'FirestoreWeightsDataSourceImpl getWeights() "/"')
          //     }
          // });
          // return result;
          // });
        });
    return result;
  }
}
