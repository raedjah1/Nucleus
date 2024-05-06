import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/repositories/user_repo.dart';
import 'package:nucleus/shared/core/exception.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/service.dart';

class RegisterUserWithPhoneRequest {
  final String phoneNumber;

  RegisterUserWithPhoneRequest(this.phoneNumber);
}

typedef RegisterUserWithPhoneResponse = Future<Either<Failure, void>>;

class RegisterUserWithPhoneService extends Service<RegisterUserWithPhoneRequest,
    RegisterUserWithPhoneResponse> {
  final UserRepo _userRepo;

  RegisterUserWithPhoneService(this._userRepo);

  @override
  RegisterUserWithPhoneResponse execute(
      RegisterUserWithPhoneRequest request) async {
    try {
      await _userRepo.registerWithPhoneNumber(request.phoneNumber);
      return right(null);
    } on ApiException catch (e) {
      return left(ApiFailure(e.message));
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
