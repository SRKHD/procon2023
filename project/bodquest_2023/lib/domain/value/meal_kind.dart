enum MealKind {
  breakfast('breakfast'), // 朝食
  lunch('lunch'), // 昼食
  dinner('dinner'), // 夕食
  snack('snack'); // 間食

  final String stringValue;
  const MealKind(this.stringValue);

  factory MealKind.from(String value) {
    switch (value) {
      case 'breakfast':
        return MealKind.breakfast;
      case 'lunch':
        return MealKind.lunch;
      case 'dinner':
        return MealKind.dinner;
      case 'snack':
        return MealKind.snack;
      default:
        throw UnimplementedError();
    }
  }
}
