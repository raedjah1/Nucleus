import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/directory_bloc.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';
import 'package:nucleus/modules/accounts/index.dart' as accounts_di;
import 'package:nucleus/modules/accounts/ui/widgets/employee_widget.dart';

class EmployeeDirectoryScreen extends StatefulWidget {
  const EmployeeDirectoryScreen({super.key});

  @override
  State<EmployeeDirectoryScreen> createState() =>
      _EmployeeDirectoryScreenState();
}

class _EmployeeDirectoryScreenState extends State<EmployeeDirectoryScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Account> employees = [];
  List<Account> filteredEmployees = [];

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
              return Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: "Search directory",
                    ),
                    onChanged: (value) {
                      setState(() {
                        filteredEmployees = employees
                            .where((employee) => employee.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: employees.length,
                      itemBuilder: (context, index) {
                        final employee = employees[index];
                        return EmployeeWidget(
                          employee: employee,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
