import 'package:flutter/material.dart';
import 'package:nucleus/modules/accounts/domain/models/account.dart';

import '../../themes/constants.dart';
import 'package:intl/intl.dart';
import 'package:nucleus/modules/accounts/ui/widgets/base_scaffold.dart';

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

  String getCurrentDate() {
    DateTime now = DateTime.now();
    return DateFormat('dd MMM yyyy').format(now);
  }

  String getCurrentTime() {
    DateTime now = DateTime.now();
    return DateFormat('HH:mm').format(now);
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return BaseScaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      title: 'Welcome, ${widget.account.name} 👋',
      body: SingleChildScrollView(

        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    Text(
                      'Don\'t miss your attendance today!',
                      style: textTheme.titleMedium!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.access_time, color: primaryColorLight),
                        const SizedBox(width: 4),
                        Text(
                          '${getCurrentDate()} • ${getCurrentTime()}',
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColorLight,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          // Clock in logic
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time, color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              'Clock In | 08:30',
                              style: textTheme.labelMedium!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: primaryColorLight,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming Events',
                      style: textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/nucleus_logo.png', // Update the path accordingly
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Heads Up! Birthday Incoming 🎂',
                                  style: textTheme.titleSmall!.copyWith(
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Don\'t forget to wish Ash Maliek Jeng a happy birthday today!',
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: colorScheme.onSurface.withOpacity(0.55),
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
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    'Main Menu',
                    style: textTheme.titleMedium!.copyWith(
                      color: colorScheme.onSurface.withOpacity(0.85),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildMenuTile(
                        context,
                        color: Colors.blue,
                        icon: Icons.calendar_today,
                        title: 'Leave',
                        onTap: () {
                          // Navigate to Leave screen
                        },
                      ),
                      _buildMenuTile(
                        context,
                        color: primaryColorLight,
                        icon: Icons.people,
                        title: 'Employees',
                        onTap: () {
                          // Navigate to Employees screen
                        },
                      ),
                      _buildMenuTile(
                        context,
                        color: Colors.green,
                        icon: Icons.access_time,
                        title: 'Attendance',
                        onTap: () {
                          // Navigate to Attendance screen
                        },
                      ),
                      _buildMenuTile(
                        context,
                        color: Colors.brown,
                        icon: Icons.add,
                        title: 'Add Menu',
                        onTap: () {
                          // Navigate to Add Menu screen
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, {
    required Color color,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              radius: 30,
              child: Icon(
                icon,
                size: 30,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}