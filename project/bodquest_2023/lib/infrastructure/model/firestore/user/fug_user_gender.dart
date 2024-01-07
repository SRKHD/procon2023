enum FugUserGender {
  male('male'),
  female('female'),
  none('');

  final String value;
  const FugUserGender(this.value);

  factory FugUserGender.from(String value) {
    switch (value) {
      case 'male':
        return FugUserGender.male;
      case 'female':
        return FugUserGender.female;
      case '':
        return FugUserGender.none;
      default:
        throw UnimplementedError();
    }
  }
}
