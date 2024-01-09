enum RankImage {
  rankUnknown('unknown.png'),
  rankG('tree_rank_g.png'),
  rankF('tree_rank_f.png'),
  rankE('tree_rank_e.png'),
  rankD('tree_rank_d.png'),
  rankC('tree_rank_c.png'),
  rankB('tree_rank_b.png'),
  rankA('tree_rank_a.png'),
  rankS('tree_rank_s.png');

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
  //setting('tab_setting.png'),
  arrowLeft('arrow_left.png'),
  arrowRight('arrow_right.png'),
  meal('tab_meal.png');

  const TabImage(this.name);

  final String name;
  String get path => 'assets/images/$name';
}
