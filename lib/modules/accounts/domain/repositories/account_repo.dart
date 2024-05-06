import 'package:nucleus/modules/accounts/domain/models/account.dart';

abstract class AccountRepo {
  Future<Account> getAccountWithToken(String token);
  Future<List<Account>> getAccounts();
}
