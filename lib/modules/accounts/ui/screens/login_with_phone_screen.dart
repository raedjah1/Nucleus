import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/authentication_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/registration_bloc.dart';
import 'package:nucleus/modules/accounts/index.dart' as accounts_di;
import 'package:nucleus/modules/accounts/ui/widgets/login_with_phone_form_widget.dart';
import 'package:nucleus/modules/accounts/ui/widgets/verify_phone_form_widget.dart';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({super.key});

  @override
  State<LoginWithPhoneScreen> createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen> {
  void _notifyError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => accounts_di.sl<RegistrationBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<RegistrationBloc, RegistrationState>(
            listener: (context, state) {
              if (state is AccountTokenObtained) {
                BlocProvider.of<RegistrationBloc>(context).add(
                  SaveToken(state.token),
                );
              }
              if (state is TokenSaved) {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  AppStart(),
                );
              }

              if (state is RegistrationFailed) {
                _notifyError(context, state.message);
              }

              if (state is VerificationFailed) {
                _notifyError(context, state.message);
              }
            },
            child: BlocBuilder<RegistrationBloc, RegistrationState>(
              builder: (context, state) {
                if (state is RegistrationLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is RegistrationInitial) {
                  return const LoginWithPhoneFormWidget();
                } else if (state is RegistrationFailed) {
                  return const LoginWithPhoneFormWidget();
                }
                return const VerifyPhoneFormWidget();
              },
            ),
          ),
        ),
      ),
    );
  }
}
