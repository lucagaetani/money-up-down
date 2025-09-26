import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          Consumer<AppProvider>(
            builder: (context, appProvider, child) {
              return ListTile(
                leading: Icon(appProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
                title: Text('Dark Mode'),
                trailing: Switch(
                  value: appProvider.isDarkMode,
                  onChanged: (value) {
                    // Use listen: false when calling a method inside a callback
                    Provider.of<AppProvider>(context, listen: false).toggleTheme();
                  },
                ),
              );
            },
          ),
          // You can add other settings here, like "Manage Categories"
        ],
      ),
    );
  }
}