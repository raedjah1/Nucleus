part of 'directory_bloc.dart';

sealed class DirectoryEvent extends Equatable {
  const DirectoryEvent();

  @override
  List<Object> get props => [];
}

final class LoadDirectory extends DirectoryEvent {}
