abstract interface class IUpdateUserInfoUsecase {
  Future<int> execute(
    String userId,
    String userName,
    DateTime birthday,
  );
}
