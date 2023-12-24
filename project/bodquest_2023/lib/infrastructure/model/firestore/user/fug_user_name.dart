class FugUserName {
  final String title;
  final String first;
  final String last;

  FugUserName({
    required this.first,
    required this.last,
    required this.title,
  });

  factory FugUserName.fromJson(Map<String, dynamic> json) {
    return FugUserName(
      first: json['first'],
      last: json['last'],
      title: json['title'],
    );
  }
}
