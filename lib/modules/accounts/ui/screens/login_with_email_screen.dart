import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/authentication_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/registration_bloc.dart';
import 'package:nucleus/modules/accounts/index.dart' as accounts_di;
import 'package:nucleus/modules/accounts/ui/widgets/login_with_email_form_widget.dart';
import 'package:nucleus/modules/accounts/ui/screens/login_with_phone_screen.dart';


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
                          borderRadius: BorderRadius.circular(4),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
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
                      onPressed: () {
                            Navigator.pushNamed(context, '/phoneLogin');
                      },
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
