import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/repositories/account_repo.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/usecase.dart';

typedef GetSessionResponse = Future<Either<Failure, String>>;

class GetSessionUseCase implements UseCase<void, GetSessionResponse> {
  final AccountRepo _accountRepo;

  GetSessionUseCase(this._accountRepo);

  @override
  GetSessionResponse execute(void request) async {
    try {
      final session = await _accountRepo.getSession();
      return right(session);
    } on Exception catch (e) {
      return left(ApiFailure(e.toString()));
    } catch (e) {
      return left(AppFailure("An error occurred. Please try again later."));
    }
  }
}
