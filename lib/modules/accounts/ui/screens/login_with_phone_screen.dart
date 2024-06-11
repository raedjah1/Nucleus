import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/authentication_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/registration_bloc.dart';
import 'package:nucleus/modules/accounts/index.dart' as accounts_di;
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({Key? key}) : super(key: key);

  @override
  _LoginWithPhoneScreenState createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen> {
  final TextEditingController _phoneController = TextEditingController();

  Future<void> registerPhoneNumber(String phoneNumber) async {
    const apiUrl = 'https://pim-api.swat3.qcell.gm/api/v1';
    const registerEndpoint = '/register';
    final url = Uri.parse('$apiUrl$registerEndpoint');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'phoneNumber': phoneNumber}),
    );


    if (response.statusCode == 200) {
      // Handle successful registration and send OTP
      Navigator.pushNamed(context, '/otp', arguments: phoneNumber); // Pass the phone number to OTP screen
    } else {
      // Handle error
      final responseData = jsonDecode(response.body);
      final errorMessage = responseData['message'] ?? 'Registration failed';

      // Show the nicely formatted message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border.all(color: colorScheme.onSurface.withOpacity(0.075), width: 1.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: 'Phone No.',
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
                onPressed: () async {
                  await registerPhoneNumber(_phoneController.text);
                },
                child: Text(
                  'Next',
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
              onPressed: () {
                Navigator.pushNamed(context, '/emailLogin');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: colorScheme.primary),
                  const SizedBox(width: 10),
                  Text(
                    'Email Address',
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
    );
  }
}
