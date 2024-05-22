part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class Unauthenticated extends AuthenticationState {
  final String message;

  const Unauthenticated(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpired extends AuthenticationState {}

final class Authenticated extends AuthenticationState {
  final Account account;

  const Authenticated(this.account);

  @override
  List<Object> get props => [account];
}
