import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';
import 'package:nucleus/modules/accounts/domain/usecases/get_account_with_token_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/get_session_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/logout_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetSessionUseCase getSessionUseCase;
  final GetAccountWithTokenUseCase getAccountWithTokenUseCase;
  final LogoutUseCase logoutUseCase;

  AuthenticationBloc({
    required this.getSessionUseCase,
    required this.getAccountWithTokenUseCase,
    required this.logoutUseCase,
  }) : super(AuthenticationInitial()) {
    on<AppStart>(_onAppStart);
    on<Logout>(_onLogout);
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void _onAppStart(AppStart event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final session = await getSessionUseCase.execute(null);
    session.fold(
      (failure) => emit(Unauthenticated(failure.message)),
      (token) async {
        final account = await getAccountWithTokenUseCase
            .execute(GetAccountWithTokenRequest(token: token));
        account.fold(
          (failure) => emit(TokenExpired()),
          (account) => emit(Authenticated(account)),
        );
      },
    );
  }

  void _onLogout(Logout event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final result = await logoutUseCase.execute(null);
    result.fold(
      (failure) => emit(Unauthenticated(failure.message)),
      (_) => emit(const Unauthenticated("Logged out successfully")),
    );
  }
}
