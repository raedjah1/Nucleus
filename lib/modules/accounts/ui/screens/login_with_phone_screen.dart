import 'package:flutter/material.dart';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({super.key});

  @override
  State<LoginWithPhoneScreen> createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Login with Phone",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Phone",
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
    );
  }
}
