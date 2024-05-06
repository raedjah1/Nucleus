import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/repositories/user_repo.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/service.dart';

typedef LogoutResponse = Future<Either<Failure, void>>;

class LogoutService implements Service<void, LogoutResponse> {
  final UserRepo _userRepo;

  LogoutService(this._userRepo);

  @override
  LogoutResponse execute(void request) async {
    try {
      await _userRepo.logout();
      return right(null);
    } on Exception catch (e) {
      return left(AppFailure(e.toString()));
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
