import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/components/home_page.dart';
import 'package:frontend/components/settings_page.dart';
import 'package:frontend/components/theme_provider.dart';
import 'package:frontend/database/database.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: MyApp(),
      ),
  );
  DatabaseHelper.instance.database;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MUPDN',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page = HomePage();

    switch (selectedIndex) {
      case 0:
        page = HomePage();
      case 1:
        page = SettingsPage();
    }

    void changeIndex(int value) {
      setState(() {
        selectedIndex = value;
      });
    }
    
    return Column(
      children: [
        Expanded(child: page),
        BottomNavigationBar(
          
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          ],
          selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.tertiary),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          currentIndex: selectedIndex,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onTap: (selectedIndex) => {changeIndex(selectedIndex)},
        )
      ],
    );
  }
}
