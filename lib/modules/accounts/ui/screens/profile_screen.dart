import 'package:flutter/material.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';

class ProfileScreen extends StatefulWidget {
  final Account account;

  const ProfileScreen({
    super.key,
    required this.account,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Image.network("https://via.placeholder.com/150"),
                  Row(
                    children: [
                      Text(widget.account.name),
                      Text(widget.account.jobTitle.name),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
