import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/registration_bloc.dart';
import 'package:nucleus/modules/accounts/index.dart' as accounts_di;

class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({super.key});

  @override
  State<LoginWithEmailScreen> createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => accounts_di.sl<RegistrationBloc>(),
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationFailed) {
            // Navigator.of(context).pushNamed("/home");
          } else if (state is TokenSaved) {}
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Login with Email",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: null,
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
