part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

final class RegisterWithPhone extends RegistrationEvent {
  final String phoneNumber;

  const RegisterWithPhone(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class VerifyPhone extends RegistrationEvent {
  final String code;
  final String phoneNumber;

  const VerifyPhone(this.code, this.phoneNumber);

  @override
  List<Object> get props => [code, phoneNumber];
}

class RegisterWithEmail extends RegistrationEvent {
  final String email;
  final String password;

  const RegisterWithEmail(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SaveToken extends RegistrationEvent {
  final String token;

  const SaveToken(this.token);

  @override
  List<Object> get props => [token];
}
