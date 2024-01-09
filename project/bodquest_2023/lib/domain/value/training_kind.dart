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
