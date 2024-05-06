abstract class UserRepo {
  Future<String> registerWithEmailAndPassword(String email, String password);
  Future<void> registerWithPhoneNumber(String phoneNumber);
  Future<String> verifyPhoneNumber(String phoneNumber, String smsCode);
  Future<void> logout();
}
