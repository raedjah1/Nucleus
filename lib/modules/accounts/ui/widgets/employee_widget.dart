import 'package:flutter/material.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';

class EmployeeWidget extends StatelessWidget {
  final Account employee;

  const EmployeeWidget({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network("https://via.placeholder.com/150"),
                  Column(
                    children: [
                      Text(employee.name),
                      Text(employee.jobTitle.name),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.email),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
