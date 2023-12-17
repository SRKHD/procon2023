
class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    switch(message)
    {
      case 'invalid-email':
        return '有効なメールアドレスを入力してください。';
      case 'email-already-in-use':
        return '指定したメールアドレスは登録済みです。';
      case 'user-not-found': // メールアドレスが登録されていない場合
      case 'wrong-password': // パスワードが間違っている場合
      case 'invalid-login-credentials': // パスワードが間違っている場合
      case 'missing-password': // パスワードが短い場合
        return 'メールアドレスかパスワードが間違っています。';
      case 'error':
        // メールアドレスかパスワードがEmpty or Nullの場合
        return 'メールアドレスとパスワードを入力してください。';
      default:
        return '有効ではありません';
    }
  }
}
