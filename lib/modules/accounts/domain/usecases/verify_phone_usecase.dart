import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/repositories/user_repo.dart';
import 'package:nucleus/shared/core/exception.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/usecase.dart';

class VerifyPhoneRequest {
  final String phoneNumber;
  final String verificationCode;

  VerifyPhoneRequest({
    required this.phoneNumber,
    required this.verificationCode,
  });
}

typedef VerifyPhoneResponse = Future<Either<Failure, String>>;

class VerifyPhoneUseCase
    implements UseCase<VerifyPhoneRequest, VerifyPhoneResponse> {
  final UserRepo _userRepo;

  VerifyPhoneUseCase(this._userRepo);

  @override
  VerifyPhoneResponse execute(VerifyPhoneRequest request) async {
    try {
      final token = await _userRepo.verifyPhoneNumber(
        request.phoneNumber,
        request.verificationCode,
      );
      return right(token);
    } on ApiException catch (e) {
      return left(ApiFailure(e.toString()));
    } catch (e) {
      return left(AppFailure("An error occurred. Please try again."));
    }
  }
}
