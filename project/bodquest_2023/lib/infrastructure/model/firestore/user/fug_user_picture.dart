class FugUserPicture {
  final String large;
  final String medium;
  final String thumbnail;

  FugUserPicture({
    required this.thumbnail,
    required this.large,
    required this.medium,
  });

  factory FugUserPicture.fromJson(Map<String, dynamic> json) {
    return FugUserPicture(
      thumbnail: json['thumbnail'],
      large: json['large'],
      medium: json['medium'],
    );
  }
}
