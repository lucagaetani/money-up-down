import 'package:flutter/material.dart';
import 'package:money_up_down/providers/app_provider.dart';
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
      child: MaterialApp(
        title: 'Money Up Down',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}