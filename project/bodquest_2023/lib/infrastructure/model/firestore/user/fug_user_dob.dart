class FugUserDob {
  final DateTime date;
  final int age;

  FugUserDob({
    required this.age,
    required this.date,
  });

  factory FugUserDob.fromJson(Map<String, dynamic> json) {
    return FugUserDob(
      age: json['age'],
      date: DateTime.parse(json['date']),
    );
  }
}
