import 'package:get_it/get_it.dart';
import 'package:nucleus/modules/accounts/data/bloc/authentication_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/directory_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/registration_bloc.dart';
import 'package:nucleus/modules/accounts/domain/repositories/account_repo.dart';
import 'package:nucleus/modules/accounts/domain/repositories/user_repo.dart';
import 'package:nucleus/modules/accounts/domain/services/account_service.dart';
import 'package:nucleus/modules/accounts/domain/services/user_service.dart';
import 'package:nucleus/modules/accounts/domain/usecases/get_account_with_token_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/get_session_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/get_staff_directory_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/logout_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/register_with_email_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/register_with_phone_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/save_account_usecase.dart';
import 'package:nucleus/modules/accounts/domain/usecases/verify_phone_usecase.dart';
import '../../shared/index.dart' as shared_di;

final sl = GetIt.instance;

Future<void> init() async {
  initFeatures();
}

void initFeatures() {
  sl.registerLazySingleton<AccountRepo>(
    () => AccountService(
      shared_di.sl(),
      shared_di.sl(),
    ),
  );
  sl.registerLazySingleton<UserRepo>(
    () => UserService(
      shared_di.sl(),
    ),
  );

  // UseCases
  sl.registerLazySingleton(
    () => RegisterWithEmailUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => RegisterWithPhoneUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => VerifyPhoneUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetAccountWithTokenUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetSessionUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SaveSessionUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LogoutUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetStaffDirectoryUseCase(
      sl(),
    ),
  );

  // Blocs
  sl.registerFactory(
    () => RegistrationBloc(
      registerWithEmailUseCase: sl(),
      verifyPhoneUseCase: sl(),
      registerWithPhoneUseCase: sl(),
      saveSessionUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => AuthenticationBloc(
      getSessionUseCase: sl(),
      getAccountWithTokenUseCase: sl(),
      logoutUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => DirectoryBloc(
      getStaffDirectoryUseCase: sl(),
    ),
  );
}
