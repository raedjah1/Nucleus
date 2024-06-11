import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _otpControllers = List.generate(4, (index) => TextEditingController());

  Future<void> verifyOtp(String phoneNumber, String otp) async {
    const apiUrl = 'https://pim-api.swat3.qcell.gm/api/v1';
    const verifyEndpoint = '/verify';
    final url = Uri.parse('$apiUrl$verifyEndpoint');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'phoneNumber': phoneNumber, 'otp': otp}),
    );

    if (response.statusCode == 200) {
      // Handle successful OTP verification
      print('OTP verification successful');
      // Navigate to next screen or home screen
      Navigator.pushNamed(context, '/home');
    } else {
      final responseData = jsonDecode(response.body);
      final errorMessage = responseData['message'] ?? 'Registration failed';

      // Show the nicely formatted message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      print('OTP verification failed: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final phoneNumber = ModalRoute.of(context)?.settings.arguments as String; // Get phone number passed from previous screen

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 64),
            Center(
              child: Image.asset(
                'assets/nucleus_logo.png', // Ensure this path is correct
                width: 160,
                height: 142,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Enter the OTP sent to you',
              style: textTheme.headlineMedium!.copyWith(
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          border: Border.all(color: colorScheme.onSurface.withOpacity(0.075), width: 1.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextField(
                          controller: _otpControllers[index],
                          textAlign: TextAlign.center,
                          style: textTheme.headlineMedium!.copyWith(color: colorScheme.onSurface),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      );
                    }),
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
                      onPressed: () {
                        final otp = _otpControllers.map((controller) => controller.text).join();
                        verifyOtp(phoneNumber, otp);
                      },
                      child: Text(
                        'Verify',
                        style: textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn’t receive OTP?',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.55),
                        ),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          // TODO: Add resend OTP logic here
                        },
                        child: Text(
                          'Resend Code',
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        side: BorderSide(color: colorScheme.primary, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.arrow_back, color: Colors.orange),
                          const SizedBox(width: 10),
                          Text(
                            'Back',
                            style: textTheme.bodyMedium!.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
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
