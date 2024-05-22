part of 'registration_bloc.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationLoading extends RegistrationState {}

final class RegistrationFailed extends RegistrationState {
  final String message;

  const RegistrationFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class RegistrationSuccess extends RegistrationState {}

final class VerificationFailed extends RegistrationState {
  final String message;

  const VerificationFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class AccountTokenObtained extends RegistrationState {
  final String token;

  const AccountTokenObtained(this.token);

  @override
  List<Object> get props => [token];
}

final class TokenSaved extends RegistrationState {}
