import 'package:flutter/material.dart';

class LoginWithEmailFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function onSubmit;

  const LoginWithEmailFormWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
