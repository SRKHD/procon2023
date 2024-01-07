enum TrainingKind {
  walk('walk'), // 歩く
  run('run'), // ランニング
  workOut('workOut'); // 筋トレ

  final String value;
  const TrainingKind(this.value);

  factory TrainingKind.from(String value) {
    switch (value) {
      case 'walk':
        return TrainingKind.walk;
      case 'run':
        return TrainingKind.run;
      case 'workOut':
        return TrainingKind.workOut;
      default:
        throw UnimplementedError();
    }
  }
}

enum MealKind {
  breakfast('breakfast'), // 朝食
  lunch('lunch'), // 昼食
  dinner('dinner'), // 夕食
  snack('snack'); // 間食

  final String value;
  const MealKind(this.value);

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
