class FugUserName {
  //final String title;
  //final String first;
  //final String last;
  final String userName;

  FugUserName({
    //required this.first,
    //required this.last,
    //required this.title,
    required this.userName,
  });

  factory FugUserName.fromJson(String json) {
    return FugUserName(
      //first: json['first'],
      //last: json['last'],
      //title: json['title'],
      userName: json,
    );
  }
}
