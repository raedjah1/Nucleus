import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';
import 'package:nucleus/modules/accounts/domain/usecases/get_staff_directory_usecase.dart';

part 'directory_event.dart';
part 'directory_state.dart';

class DirectoryBloc extends Bloc<DirectoryEvent, DirectoryState> {
  final GetStaffDirectoryUseCase getStaffDirectoryUseCase;

  DirectoryBloc({
    required this.getStaffDirectoryUseCase,
  }) : super(DirectoryInitial()) {
    on<LoadDirectory>(_onLoadDirectory);
  }

  void _onLoadDirectory(
      LoadDirectory event, Emitter<DirectoryState> emit) async {
    emit(DirectoryLoading());
    final response = await getStaffDirectoryUseCase.execute(null);
    response.fold(
          (failure) => emit(DirectoryError(failure.message)),
          (accounts) => emit(DirectoryLoaded(accounts)),
    );
  }
}
