enum EvaluationRank {
  g('g'),
  f('f'),
  e('e'),
  d('d'),
  c('c'),
  b('b'),
  a('a'),
  s('s');

  final String value;
  const EvaluationRank(this.value);

  factory EvaluationRank.from(String value) {
    switch (value) {
      case 'g':
        return EvaluationRank.g;
      case 'f':
        return EvaluationRank.f;
      case 'e':
        return EvaluationRank.e;
      case 'd':
        return EvaluationRank.d;
      case 'c':
        return EvaluationRank.c;
      case 'b':
        return EvaluationRank.b;
      case 'a':
        return EvaluationRank.a;
      case 's':
        return EvaluationRank.s;
      default:
        throw UnimplementedError();
    }
  }
}
