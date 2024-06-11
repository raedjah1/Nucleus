import 'package:flutter/material.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';

class EmployeeCard extends StatelessWidget {
  final Account account;

  const EmployeeCard({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(account.photoUrl), // Use account.photoUrl
          child: Text(account.name[0]), // Fallback to initials
        ),
        title: Text(account.name, style: textTheme.titleMedium),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${account.jobTitle} • ${account.company}'),
            Text(account.department),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                // Handle phone call
              },
            ),
            IconButton(
              icon: Icon(Icons.email),
              onPressed: () {
                // Handle email
              },
            ),
          ],
        ),
      ),
    );
  }
}
