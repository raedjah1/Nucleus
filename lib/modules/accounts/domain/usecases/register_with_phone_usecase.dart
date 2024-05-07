import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/repositories/user_repo.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/usecase.dart';

class RegisterWithPhoneRequest {
  final String phone;

  const RegisterWithPhoneRequest({
    required this.phone,
  });
}

typedef RegisterWithPhoneResponse = Future<Either<Failure, void>>;

class RegisterWithPhoneUseCase
    implements UseCase<RegisterWithPhoneRequest, RegisterWithPhoneResponse> {
  final UserRepo _userRepo;

  RegisterWithPhoneUseCase(this._userRepo);

  @override
  RegisterWithPhoneResponse execute(RegisterWithPhoneRequest request) async {
    try {
      await _userRepo.registerWithPhoneNumber(request.phone);
      return right(null);
    } on Exception catch (e) {
      return left(AppFailure(e.toString()));
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
