import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';
import 'package:nucleus/modules/accounts/domain/repositories/account_repo.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/usecase.dart';

typedef GetAccountsResponse = Future<Either<Failure, List<Account>>>;

class GetAccountsUseCase implements UseCase<void, GetAccountsResponse> {
  final AccountRepo _accountRepo;

  GetAccountsUseCase(this._accountRepo);

  @override
  GetAccountsResponse execute(void request) async {
    try {
      final accounts = await _accountRepo.getAccounts();
      return right(accounts);
    } on Exception catch (e) {
      return left(ApiFailure(e.toString()));
    } catch (e) {
      return left(AppFailure("An error occurred. Please try again later."));
    }
  }
}
