enum FugMealKind {
  breakfast('breakfast'),
  lunch('lunch'),
  dinner('dinner'),
  snack('snack');

  final String value;
  const FugMealKind(this.value);

  factory FugMealKind.from(String value) {
    switch (value) {
      case 'breakfast':
        return FugMealKind.breakfast;
      case 'lunch':
        return FugMealKind.lunch;
      case 'dinner':
        return FugMealKind.dinner;
      case 'snack':
        return FugMealKind.snack;
      default:
        throw UnimplementedError();
    }
  }
}
