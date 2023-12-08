import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_test/flutter_test.dart';

// 参考
// https://zenn.dev/joo_hashi/articles/98181d2910a203
// https://pub.dev/documentation/fake_cloud_firestore/latest/

void main() async {
  final instance = FakeFirebaseFirestore();
  await instance.collection('users').add({
    'username': 'Bob',
  });
  await instance.collection('users').add({
    'username': 'Tom',
  });
  final snapshot = await instance
      .collection('users')
      .where('username', isEqualTo: 'Bob')
      .get();
  print(snapshot.docs.length); // 1
  print(snapshot.docs.first.get('username')); // 'Bob'
  print(instance.dump());

  final snapshot2 = instance
      .collection('users')
      .where('username', isEqualTo: 'Bob')
      .snapshots();

  snapshot2.listen((qrySnapshot) {
    final List<String> names = qrySnapshot.docs.map((document) {
      Map<String, dynamic> data = document.data();
      String s = data['username'];
      return s;
    }).toList();
    print('before...');
    try {
      for (var name in names) {
        print('aaa:$name');
      }
      print('after...');
    } catch (e) {
      print(e);
    }
  });
  // print(await snapshot2.length); // 1
  // snapshot2.forEach((element) {
  //   print(element.toString());
  // }};
  print('end...');
}
