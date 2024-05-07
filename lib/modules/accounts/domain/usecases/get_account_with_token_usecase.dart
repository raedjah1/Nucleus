import 'package:dartz/dartz.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';
import 'package:nucleus/modules/accounts/domain/repositories/account_repo.dart';
import 'package:nucleus/shared/core/failure.dart';
import 'package:nucleus/shared/core/usecase.dart';

class GetAccountWithTokenRequest {
  final String token;

  const GetAccountWithTokenRequest({
    required this.token,
  });
}

typedef GetAccountWithTokenResponse = Future<Either<Failure, Account>>;

class GetAccountWithTokenUseCase
    implements
        UseCase<GetAccountWithTokenRequest, GetAccountWithTokenResponse> {
  final AccountRepo _accountRepo;

  GetAccountWithTokenUseCase(this._accountRepo);

  @override
  GetAccountWithTokenResponse execute(
      GetAccountWithTokenRequest request) async {
    try {
      final account = await _accountRepo.getAccountWithToken(request.token);
      return right(account);
    } on Exception catch (e) {
      return left(ApiFailure(e.toString()));
    } catch (e) {
      return left(AppFailure("An error occurred. Please try again later."));
    }
  }
}
