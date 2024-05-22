import 'package:nucleus/modules/accounts/domain/repositories/user_repo.dart';
import 'package:nucleus/shared/core/rest_client.dart';

class UserService implements UserRepo {
  final RestClient _restClient;

  UserService(this._restClient);

  @override
  Future<void> logout() async {
    await _restClient.post('/logout', {});
  }

  @override
  Future<String> registerWithEmailAndPassword(
      String email, String password) async {
    final payload = {
      'email': email,
      'password': password,
    };

    final response =
        await _restClient.post<Map<String, dynamic>>('/register', payload);

    return response['token'];
  }

  @override
  Future<void> registerWithPhoneNumber(String phoneNumber) async {
    final payload = {
      'phone': phoneNumber,
    };

    await _restClient.post('/register/phone', payload);
  }

  @override
  Future<String> verifyPhoneNumber(String phoneNumber, String smsCode) async {
    final payload = {
      'phone': phoneNumber,
      'smsCode': smsCode,
    };

    final response = await _restClient.post<Map<String, dynamic>>(
      '/verify/phone',
      payload,
    );

    return response['token'];
  }
}
