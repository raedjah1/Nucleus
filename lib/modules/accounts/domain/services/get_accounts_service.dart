import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';
import 'package:nucleus/modules/accounts/domain/repositories/account_repo.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/service.dart';

typedef GetAccountsResponse = Future<Either<Failure, List<Account>>>;

class GetAccountsService implements Service<void, GetAccountsResponse> {
  final AccountRepo _accountRepo;

  GetAccountsService(this._accountRepo);

  @override
  GetAccountsResponse execute(void request) async {
    try {
      final accounts = await _accountRepo.getAccounts();
      return right(accounts);
    } on Exception catch (e) {
      return left(AppFailure(e.toString()));
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
