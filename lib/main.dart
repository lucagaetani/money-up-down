import 'package:flutter/material.dart';
import 'package:money_up_down/providers/app_provider.dart';
import 'package:money_up_down/theme/themes.dart';
import 'package:provider/provider.dart';

import 'components/home_screen.dart';
import 'database/database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final db = AppDatabase();
    return ChangeNotifierProvider(
      create: (context) => AppProvider(db: db),
      child: Consumer<AppProvider>( // Use a Consumer to listen for theme changes
        builder: (context, appProvider, child) {
          return MaterialApp(
            title: 'Expense Tracker',
            // Use the theme data from our theme file
            theme: lightTheme,
            darkTheme: darkTheme,
            // Control which theme is active based on the provider's state
            themeMode: appProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}