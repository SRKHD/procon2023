/// 画面ID
enum PageId {
  login,
  registration,
  main,
  weightlist,
  weightedit,
  traininglist,
}

/// 画面パス
extension PagePath on PageId {
  String get path => switch (this) {
        PageId.login => '/login',
        PageId.registration => '/registration',
        PageId.main => '/main',
        PageId.weightlist => '/weight/list',
        PageId.weightedit => '/weight/edit/:id',
        PageId.traininglist => '/training/list',
      };
}

/// 画面名
extension PageName on PageId {
  String get routeName => switch (this) {
        PageId.login => 'login',
        PageId.registration => 'registration',
        PageId.main => 'main',
        PageId.weightlist => 'weightlist',
        PageId.weightedit => 'weightedit',
        PageId.traininglist => 'traininglist',
      };
}
