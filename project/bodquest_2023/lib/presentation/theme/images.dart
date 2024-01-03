enum RankImage {
  rankUnknown('unknown.png'),
  rankG('rank_g.png'),
  rankF('rank_f.png'),
  rankE('rank_e.png'),
  rankD('rank_d.png'),
  rankC('rank_c.png'),
  rankB('rank_b.png'),
  rankA('rank_a.png'),
  rankS('rank_s.png');

  const RankImage(this.name);

  final String name;
  String get path => 'assets/images/$name';
}

enum BrandImage {
  trainingWalk('training_walk.png'),
  trainingRun('training_run.png'),
  trainingWorkOut('training_workout.png');

  const BrandImage(this.name);

  final String name;
  String get path => 'assets/images/$name';
}

enum TabImage {
  home('tab_home.png'),
  user('tab_user.png'),
  weight('tab_weight.png'),
  training('tab_training.png'),
  setting('tab_setting.png'),
  arrowLeft('arrow_left.png'),
  arrowRight('arrow_right.png');

  const TabImage(this.name);

  final String name;
  String get path => 'assets/images/$name';
}
