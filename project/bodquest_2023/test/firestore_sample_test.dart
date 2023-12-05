import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:flutter_test/flutter_test.dart';

// 参考
// https://zenn.dev/joo_hashi/articles/98181d2910a203
// https://pub.dev/documentation/fake_cloud_firestore/latest/

void main() async {
  final instance = FakeFirebaseFirestore();
  await instance.collection('users').add({
    'username': 'Bob',
  });
  final snapshot = await instance.collection('users').get();
  print(snapshot.docs.length); // 1
  print(snapshot.docs.first.get('username')); // 'Bob'
  print(instance.dump());
}
