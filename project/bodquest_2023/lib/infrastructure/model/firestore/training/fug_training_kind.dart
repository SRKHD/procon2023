enum FugTrainingKind {
  walk('walk'),
  run('run'),
  workOut('workOut');

  final String value;
  const FugTrainingKind(this.value);

  factory FugTrainingKind.from(String value) {
    switch (value) {
      case 'walk':
        return FugTrainingKind.walk;
      case 'run':
        return FugTrainingKind.run;
      case 'workOut':
        return FugTrainingKind.workOut;
      default:
        throw UnimplementedError();
    }
  }
}
