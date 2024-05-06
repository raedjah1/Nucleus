import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/repositories/user_repo.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/service.dart';

class VerifyUserPhoneRequest {
  final String phoneNumber;
  final String verificationCode;

  VerifyUserPhoneRequest({
    required this.phoneNumber,
    required this.verificationCode,
  });
}

typedef VerifyUserPhoneResponse = Future<Either<Failure, String>>;

class VerifyUserPhoneService
    implements Service<VerifyUserPhoneRequest, VerifyUserPhoneResponse> {
  final UserRepo _userRepo;

  VerifyUserPhoneService(this._userRepo);

  @override
  VerifyUserPhoneResponse execute(VerifyUserPhoneRequest request) async {
    try {
      final token = await _userRepo.verifyPhoneNumber(
        request.phoneNumber,
        request.verificationCode,
      );
      return right(token);
    } on Exception catch (e) {
      return left(AppFailure(e.toString()));
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
