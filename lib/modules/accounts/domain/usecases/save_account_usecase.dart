import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';
import 'package:nucleus/modules/accounts/domain/repositories/account_repo.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/usecase.dart';

typedef SaveSessionResponse = Future<Either<Failure, void>>;

class SaveSessionUseCase implements UseCase<String, SaveSessionResponse> {
  final AccountRepo _accountRepo;

  SaveSessionUseCase(this._accountRepo);

  @override
  SaveSessionResponse execute(String request) async {
    try {
      await _accountRepo.saveSession(request);
      return right(null);
    } on Exception catch (e) {
      return left(ApiFailure(e.toString()));
    } catch (e) {
      return left(AppFailure("An error occurred. Please try again later."));
    }
  }
}
