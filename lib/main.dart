import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/authentication_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/registration_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/directory_bloc.dart';
import 'package:nucleus/modules/accounts/ui/screens/login_with_phone_screen.dart';
import 'package:nucleus/shared/themes/dark_theme.dart';
import 'package:nucleus/shared/themes/light_theme.dart';
import 'package:nucleus/shared/ui/screens/home_screen.dart';
import 'modules/accounts/ui/screens/employee_directory_screen.dart';
import 'shared/index.dart' as shared_di;
import 'modules/accounts/index.dart' as accounts_di;
import 'modules/accounts/ui/screens/login_with_email_screen.dart';
import 'modules/accounts/ui/screens/otp_screen.dart';
import 'modules/accounts/domain/models/account.dart';
import 'modules/accounts/domain/usecases/get_staff_directory_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await shared_di.init();
  await accounts_di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => accounts_di.sl<AuthenticationBloc>()
            ..add(
              AppStart(),
            ),
        ),
        BlocProvider(
          create: (_) => accounts_di.sl<RegistrationBloc>(),
        ),
        BlocProvider(
          create: (_) => accounts_di.sl<DirectoryBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return HomeScreen(
                account: Account(
                  id: '1',
                  name: 'Mbye E. Faal',
                  email: 'example@example.com',
                  gender: 'Male',
                  photoUrl: '',
                  staffId: '',
                  department: '',
                  jobTitle: '',
                  company: '',
                ),
              );
            } else if (state is AuthenticationLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return const LoginWithEmailScreen();
          },
        ),
        routes: {
          '/phoneLogin': (context) => const LoginWithPhoneScreen(),
          '/emailLogin': (context) => const LoginWithEmailScreen(),
          '/otp': (context) => const OtpScreen(),
          '/directory': (context) => const EmployeeDirectoryScreen(),
          '/home': (context) => HomeScreen(
            account: Account(
              id: '1',
              name: 'Mbye E. Faal',
              email: 'example@example.com',
              gender: 'Male',
              photoUrl: '',
              staffId: '',
              department: '',
              jobTitle: '',
              company: '',
            ),
          ),
        },
      ),
    );
  }
}
