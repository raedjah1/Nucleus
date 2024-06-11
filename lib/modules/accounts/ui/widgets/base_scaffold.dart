// lib/shared/widgets/base_scaffold.dart

import 'package:flutter/material.dart';

import '../../../../shared/themes/constants.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final bool showDrawer;
  final Color? backgroundColor;

  const BaseScaffold({
    Key? key,
    required this.body,
    required this.title,
    this.showDrawer = true,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      drawer: showDrawer ? _buildDrawer(context) : null,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        title: Text(
          title,
          style: textTheme.bodyLarge!.copyWith(
            color: colorScheme.onSurface.withOpacity(0.85),
          ),
        ),
        actions: [
          Stack(
            children: [
              Icon(Icons.notifications, color: colorScheme.onSurface),
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: body,
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Hello, User Name'), // You can replace this with the actual user data
            accountEmail: Text('UX/UI Designer - QCL0261'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/ash_jeng_profile.jpg'),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: primaryColorLight),
            title: Text('Home', style: TextStyle(color: primaryColorLight)),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: Theme.of(context).colorScheme.onSurface),
            title: Text('Leave'),
            onTap: () {
              // Navigate to Leave screen
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Theme.of(context).colorScheme.onSurface),
            title: Text('Employees'),
            onTap: () {
              Navigator.pushNamed(context, '/directory');
            },
          ),
          ListTile(
            leading: Icon(Icons.access_time, color: Theme.of(context).colorScheme.onSurface),
            title: Text('Attendance'),
            onTap: () {
              // Navigate to Attendance screen
            },
          ),

          ListTile(
            leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.onSurface),
            title: Text('Settings'),
            onTap: () {
              // Navigate to Settings screen
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.onSurface),
            title: Text('Log out'),
            onTap: () {
              // Log out logic
            },
          ),
        ],
      ),
    );
  }
}
