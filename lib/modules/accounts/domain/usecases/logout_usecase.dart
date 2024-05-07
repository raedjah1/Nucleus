import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/repositories/user_repo.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/usecase.dart';

typedef LogoutResponse = Future<Either<Failure, void>>;

class LogoutUseCase implements UseCase<void, LogoutResponse> {
  final UserRepo _userRepo;

  LogoutUseCase(this._userRepo);

  @override
  LogoutResponse execute(void request) async {
    try {
      await _userRepo.logout();
      return right(null);
    } on Exception catch (e) {
      return left(ApiFailure(e.toString()));
    } catch (e) {
      return left(
        AppFailure("An error occurred while logging out. Please try again."),
      );
    }
  }
}
