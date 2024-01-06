enum TrainingKind {
  walk('walk'), // 歩く
  run('run'), // ランニング
  workOut('workOut'); // 筋トレ

  final String stringValue;
  const TrainingKind(this.stringValue);

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
