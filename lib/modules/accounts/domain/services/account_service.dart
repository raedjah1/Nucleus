import 'package:nucleus/modules/accounts/domain/models/account.dart';
import 'package:nucleus/modules/accounts/domain/repositories/account_repo.dart';
import 'package:nucleus/shared/core/local_storage.dart';
import 'package:nucleus/shared/core/rest_client.dart';

class AccountService implements AccountRepo {
  final RestClient _restClient;
  final LocalStorage _localStorage;

  AccountService(this._restClient, this._localStorage);

  @override
  Future<Account> getAccountWithToken(String token) async {
    final response = await _restClient.get<Map<String, dynamic>>('/account');
    return Account.fromJson(response);
  }

  @override
  Future<String> getSession() async {
    final token = _localStorage.read('token');
    if (token == null) {
      throw Exception('Token not found');
    }

    return token;
  }

  @override
  Future<void> saveSession(String token) async {
    await _localStorage.save('token', token);
  }
}
