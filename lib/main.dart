import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/authentication_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/registration_bloc.dart';
import 'package:nucleus/modules/accounts/ui/screens/login_with_email_screen.dart';
import 'package:nucleus/shared/themes/dark_theme.dart';
import 'package:nucleus/shared/themes/light_theme.dart';
import 'package:nucleus/shared/ui/screens/home_screen.dart';
import 'shared/index.dart' as shared_di;
import 'modules/accounts/index.dart' as accounts_di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await shared_di.init();
  await accounts_di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return HomeScreen(
                account: state.account,
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
      ),
    );
  }
}
