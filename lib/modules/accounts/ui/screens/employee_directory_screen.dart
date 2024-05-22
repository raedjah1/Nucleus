import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/directory_bloc.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';
import 'package:nucleus/modules/accounts/index.dart' as accounts_di;

class EmployeeDirectoryScreen extends StatefulWidget {
  const EmployeeDirectoryScreen({super.key});

  @override
  State<EmployeeDirectoryScreen> createState() =>
      _EmployeeDirectoryScreenState();
}

class _EmployeeDirectoryScreenState extends State<EmployeeDirectoryScreen> {
  List<Account> employees = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => accounts_di.sl<DirectoryBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Employee Directory"),
        ),
        body: BlocListener<DirectoryBloc, DirectoryState>(
          listener: (context, state) {
            if (state is DirectoryLoaded) {
              setState(() {
                employees = state.accounts;
              });
            }
          },
          child: BlocBuilder<DirectoryBloc, DirectoryState>(
            builder: (context, state) {
              if (state is DirectoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DirectoryError) {
                return Center(
                  child: Text(state.message),
                );
              }
              return ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  return ListTile(
                    title: Text(employee.name),
                    subtitle: Text(employee.email),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
