enum FugUserGender {
  male('male'),
  female('female');

  final String value;
  const FugUserGender(this.value);

  factory FugUserGender.from(String value) {
    switch (value) {
      case 'male':
        return FugUserGender.male;
      case 'female':
        return FugUserGender.female;
      default:
        throw UnimplementedError();
    }
  }
}
