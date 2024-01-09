enum MealRegisterKind {
  meal('meal'), // 食事登録
  recipe('recipe'); // レシピ登録

  final String value;
  const MealRegisterKind(this.value);

  factory MealRegisterKind.from(String value) {
    switch (value) {
      case 'meal':
        return MealRegisterKind.meal;
      case 'recipe':
        return MealRegisterKind.recipe;
      default:
        throw UnimplementedError();
    }
  }
}
