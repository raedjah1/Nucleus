import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/authentication_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/registration_bloc.dart';
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

class LoginWithEmailScreen extends StatelessWidget {
  const LoginWithEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 64),
            Center(
              child: Image.asset(
                'assets/nucleus_logo.png', // Make sure to add the logo to your assets folder
                width: 160,
                height: 142,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Welcome',
              style: textTheme.headlineMedium!.copyWith(
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Lets Get Started!',
              style: textTheme.bodyMedium!.copyWith(
                color: colorScheme.onSurface.withOpacity(0.85),
              ),
            ),
            const SizedBox(height: 74),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      border: Border.all(color: colorScheme.onSurface.withOpacity(0.075), width: 1.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        hintStyle: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.45),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      border: Border.all(color: colorScheme.onSurface.withOpacity(0.075), width: 1.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        hintStyle: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.45),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: theme.colorScheme.onPrimary,
                backgroundColor: theme.colorScheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                elevation: 2,
              ),
              onPressed: () {},
              child: Text(
                'Login',
                style: textTheme.labelLarge!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),

                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: colorScheme.onSurface.withOpacity(0.5), thickness: 2),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or continue with',
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.onSurface.withOpacity(0.55),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: colorScheme.onSurface.withOpacity(0.5), thickness: 2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      side: BorderSide(color: colorScheme.primary, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone, color: colorScheme.primary),
                        const SizedBox(width: 10),
                        Text(
                          'Phone Number',
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
