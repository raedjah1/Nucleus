import 'package:flutter/material.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';

class HomeScreen extends StatefulWidget {
  final Account account;

  const HomeScreen({
    super.key,
    required this.account,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
