import 'package:flutter/material.dart';

class VerifyPhoneFormWidget extends StatelessWidget {
  final TextEditingController codeController;
  final Function onVerify;

  const VerifyPhoneFormWidget({
    super.key,
    required this.codeController,
    required this.onVerify,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
