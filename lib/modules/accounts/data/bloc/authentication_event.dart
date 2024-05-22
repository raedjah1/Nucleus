part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class AppStart extends AuthenticationEvent {}

final class Logout extends AuthenticationEvent {}
