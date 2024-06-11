import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nucleus/modules/accounts/data/bloc/directory_bloc.dart';
import 'package:nucleus/modules/accounts/ui/widgets/employee_card.dart';
import 'package:nucleus/shared/themes/constants.dart';
import 'package:nucleus/modules/accounts/ui/widgets/base_scaffold.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';

class EmployeeDirectoryScreen extends StatefulWidget {
  const EmployeeDirectoryScreen({super.key});

  @override
  State<EmployeeDirectoryScreen> createState() => _EmployeeDirectoryScreenState();
}

class _EmployeeDirectoryScreenState extends State<EmployeeDirectoryScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Account> employees = [];
  List<Account> filteredEmployees = [];
  String selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    context.read<DirectoryBloc>().add(LoadDirectory());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return BaseScaffold(
      title: "",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Search Employees",
                prefixIcon: Icon(Icons.search, color: colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  filteredEmployees = employees
                      .where((employee) =>
                      employee.name.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8.0,
                children: [
                  _buildChoiceChip('All', selectedFilter == 'All'),
                  _buildChoiceChip('Admin', selectedFilter == 'Admin'),
                  _buildChoiceChip('Call Center', selectedFilter == 'Call Center'),
                  _buildChoiceChip('ISP', selectedFilter == 'ISP'),
                  _buildChoiceChip('Customer Care', selectedFilter == 'Customer Care'),
                  _buildChoiceChip('Agib', selectedFilter == 'Agib'),
                  _buildChoiceChip('Qcell', selectedFilter == 'Qcell'),
                  // Add more filter chips as needed
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<DirectoryBloc, DirectoryState>(
                builder: (context, state) {
                  if (state is DirectoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DirectoryError) {
                    return Center(child: Text(state.message));
                  } else if (state is DirectoryLoaded) {
                    employees = state.accounts;
                    filteredEmployees = employees;
                    return ListView.builder(
                      itemCount: filteredEmployees.length,
                      itemBuilder: (context, index) {
                        final account = filteredEmployees[index];
                        return EmployeeCard(account: account);
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceChip(String label, bool isSelected) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 12, // Adjust the font size as needed
          color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          selectedFilter = label;
        });
        // Handle filter logic
      },
      selectedColor: colorScheme.primary,
      backgroundColor: colorScheme.surface,
      padding: EdgeInsets.symmetric(
        horizontal: 8.0, // Adjust the horizontal padding as needed
        vertical: 4.0,  // Adjust the vertical padding as needed
      ),
    );
  }
}

