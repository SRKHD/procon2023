import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/firestore/rug_get_weights_response.dart';
import '../model/firestore/rug_weight.dart';
import 'firestore_weights_datasource.dart';

class FirestoreWeightsDataSourceImpl implements IFirestoreWeightsDataSource {
  @override
  Future<RugGetWeightsResponse> getWeights({int results = 10}) async {
    RugGetWeightsResponse result = RugGetWeightsResponse(results: []);
    const userId = 'srkhd.2023@gmail.com';
    /*
    final weightsRef = FirebaseFirestore.instance
        .collection('weights') // コレクションID
        .where('userId', isEqualTo: userId);

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
        */
    print('aaa ddddd');
    await FirebaseFirestore.instance
        .collection('weights')
        .where('userId', isEqualTo: userId)
        .get()
        .then((value) => {
              /*
              print(value.size),
              print(value.docs.length),
              value.docs.forEach((e) {
                // print(e.exists),
                // print(e.data().toString()),
                // e.data(),
                RugGetWeightsResponse.fromJson(e.data());
              })
              */
              for (var doc in value.docs)
                {
                  // RugGetWeightsResponse.fromJson(doc.data()),
                  result.results.add(RugWeight.fromJson(doc.data()))
                }
            });

    return result;
  }
}
