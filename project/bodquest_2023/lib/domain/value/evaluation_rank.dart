enum EvaluationRank {
  unknown('unknown'),
  g('G'),
  f('F'),
  e('E'),
  d('D'),
  c('C'),
  b('B'),
  a('A'),
  s('S');

  final String value;
  const EvaluationRank(this.value);

  factory EvaluationRank.from(String value) {
    switch (value) {
      case 'G':
        return EvaluationRank.g;
      case 'F':
        return EvaluationRank.f;
      case 'E':
        return EvaluationRank.e;
      case 'D':
        return EvaluationRank.d;
      case 'C':
        return EvaluationRank.c;
      case 'B':
        return EvaluationRank.b;
      case 'A':
        return EvaluationRank.a;
      case 'S':
        return EvaluationRank.s;
      default:
        return EvaluationRank.unknown;
    }
  }
}
