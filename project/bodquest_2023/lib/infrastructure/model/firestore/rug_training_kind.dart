enum RugTrainingKind {
  walk('walk'),
  run('run'),
  workOut('workOut');

  final String value;
  const RugTrainingKind(this.value);

  factory RugTrainingKind.from(String value) {
    switch (value) {
      case 'walk':
        return RugTrainingKind.walk;
      case 'run':
        return RugTrainingKind.run;
      case 'workOut':
        return RugTrainingKind.workOut;
      default:
        throw UnimplementedError();
    }
  }
}
