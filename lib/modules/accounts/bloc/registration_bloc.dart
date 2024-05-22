import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nucleus/modules/accounts/domain/usecases/register_with_email_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/register_with_phone_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/save_account_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/verify_phone_usecase.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterWithEmailUseCase registerWithEmailUseCase;
  final VerifyPhoneUseCase verifyPhoneUseCase;
  final RegisterWithPhoneUseCase registerWithPhoneUseCase;
  final SaveSessionUseCase saveSessionUseCase;

  RegistrationBloc({
    required this.registerWithEmailUseCase,
    required this.verifyPhoneUseCase,
    required this.registerWithPhoneUseCase,
    required this.saveSessionUseCase,
  }) : super(RegistrationInitial()) {
    on<RegisterWithPhone>(_onRegisterWithPhone);
    on<VerifyPhone>(_onVerifyPhone);
    on<RegisterWithEmail>(_onRegisterWithEmail);
    on<SaveToken>(_onSaveToken);
    on<RegistrationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void _onRegisterWithPhone(
      RegisterWithPhone event, Emitter<RegistrationState> emit) async {
    emit(RegistrationLoading());
    final result = await registerWithPhoneUseCase
        .execute(RegisterWithPhoneRequest(phone: event.phoneNumber));
    return result.fold(
      (failure) => emit(RegistrationFailed(failure.message)),
      (_) => emit(RegistrationSuccess()),
    );
  }

  void _onVerifyPhone(
      VerifyPhone event, Emitter<RegistrationState> emit) async {
    emit(RegistrationLoading());
    final result = await verifyPhoneUseCase.execute(VerifyPhoneRequest(
        verificationCode: event.code, phoneNumber: event.phoneNumber));
    return result.fold(
      (failure) => emit(VerificationFailed(failure.message)),
      (token) => emit(AccountTokenObtained(token)),
    );
  }

  void _onRegisterWithEmail(
      RegisterWithEmail event, Emitter<RegistrationState> emit) async {
    emit(RegistrationLoading());
    final result = await registerWithEmailUseCase.execute(
        RegisterWithEmailRequest(email: event.email, password: event.password));
    return result.fold(
      (failure) => emit(RegistrationFailed(failure.message)),
      (token) => emit(AccountTokenObtained(token)),
    );
  }

  void _onSaveToken(SaveToken event, Emitter<RegistrationState> emit) async {
    emit(RegistrationLoading());
    final result = await saveSessionUseCase.execute(event.token);
    return result.fold(
      (failure) => emit(RegistrationFailed(failure.message)),
      (_) => emit(TokenSaved()),
    );
  }
}
