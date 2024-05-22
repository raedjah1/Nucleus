part of 'directory_bloc.dart';

sealed class DirectoryState extends Equatable {
  const DirectoryState();

  @override
  List<Object> get props => [];
}

final class DirectoryInitial extends DirectoryState {}

final class DirectoryLoading extends DirectoryState {}

final class DirectoryLoaded extends DirectoryState {
  final List<Account> accounts;

  const DirectoryLoaded(this.accounts);

  @override
  List<Object> get props => [accounts];
}

final class DirectoryError extends DirectoryState {
  final String message;

  const DirectoryError(this.message);

  @override
  List<Object> get props => [message];
}
