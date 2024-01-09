/// 画面ID
enum PageId {
  login,
  registration,
  main,
  weightlist,
  weightedit,
  traininglist,
  trainingedit,
  meal,
  meallist,
  mealedit,
  recipelist,
  yolov5,
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
        PageId.trainingedit => '/training/edit/:id',
        PageId.meal => '/meal',
        PageId.meallist => '/meal/meallist',
        PageId.mealedit => '/meal/mealedit/:id',
        PageId.recipelist => '/meal/recipelist',
        PageId.yolov5 => '/meal/yolov5',
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
        PageId.trainingedit => 'trainingedit',
        PageId.meal => 'meal',
        PageId.meallist => 'meallist',
        PageId.mealedit => 'mealedit',
        PageId.recipelist => 'recipelist',
        PageId.yolov5 => 'yolov5',
      };
}
