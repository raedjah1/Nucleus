import 'package:nucleus/modules/accounts/domain/models/account.dart';

abstract class AccountRepo {
  Future<void> saveSession(String token);
  Future<String> getSession();
  Future<Account> getAccountWithToken(String token);
}
