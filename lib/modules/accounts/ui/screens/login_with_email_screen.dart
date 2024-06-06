import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/authentication_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/registration_bloc.dart';
import 'package:nucleus/modules/accounts/index.dart' as accounts_di;
import 'package:nucleus/modules/accounts/ui/widgets/login_with_email_form_widget.dart';

class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({super.key});

  @override
  State<LoginWithEmailScreen> createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  void _saveToken(BuildContext context, String token) {
    final bloc = BlocProvider.of<RegistrationBloc>(context);
    bloc.add(
      SaveToken(token),
    );
  }

  void _onSubmit(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;
    final bloc = BlocProvider.of<RegistrationBloc>(context);
    bloc.add(
      RegisterWithEmail(email, password),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => accounts_di.sl<RegistrationBloc>(),
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationFailed) {
            _showError(context, state.message);
          }
          if (state is AccountTokenObtained) {
            _saveToken(context, state.token);
          }
          if (state is TokenSaved) {
            BlocProvider.of<AuthenticationBloc>(context).add(
              AppStart(),
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (context, state) {
                    if (state is RegistrationLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return LoginWithEmailFormWidget(
                      emailController: emailController,
                      passwordController: passwordController,
                      onSubmit: () => _onSubmit(context),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
