import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/repositories/user_repo.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/usecase.dart';

class RegisterWithEmailRequest {
  final String email;
  final String password;

  RegisterWithEmailRequest({
    required this.email,
    required this.password,
  });
}

typedef RegisterWithEmailResponse = Future<Either<Failure, String>>;

class RegisterWithEmailUseCase
    implements UseCase<RegisterWithEmailRequest, RegisterWithEmailResponse> {
  final UserRepo _userRepo;

  RegisterWithEmailUseCase(this._userRepo);

  @override
  RegisterWithEmailResponse execute(RegisterWithEmailRequest request) async {
    try {
      final token = await _userRepo.registerWithEmailAndPassword(
        request.email,
        request.password,
      );
      return right(token);
    } on Exception catch (e) {
      return left(AppFailure(e.toString()));
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
