import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';
import 'package:nucleus/modules/accounts/domain/repositories/account_repo.dart';
import 'package:nucleus/shared/core/exception.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/usecase.dart';

typedef GetStaffDirectoryResponse = Future<Either<Failure, List<Account>>>;

class GetStaffDirectoryUseCase
    implements UseCase<void, GetStaffDirectoryResponse> {
  final AccountRepo _accountRepo;

  GetStaffDirectoryUseCase(this._accountRepo);

  @override
  GetStaffDirectoryResponse execute(void request) async {
    try {
      final accounts = await _accountRepo.getAccounts();
      return Right(accounts);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message));
    } catch (e) {
      print('Exception: $e'); // Add logging
      return Left(AppFailure('An Unexpected error occurred'));
    }
  }
}

