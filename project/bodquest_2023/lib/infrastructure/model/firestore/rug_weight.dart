import 'package:cloud_firestore/cloud_firestore.dart';

class RugWeight {
  final String userId;
  final double value;
  final DateTime? timestamp;

  RugWeight({
    required this.userId,
    required this.value,
    this.timestamp,
  });

  factory RugWeight.fromJson(json) {
    return RugWeight(
      userId: json['userId'],
      value: json['value'].toDouble(),
      timestamp: (json['timestamp'] as Timestamp?)?.toDate(),
    );
  }
}
