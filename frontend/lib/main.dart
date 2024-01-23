import 'package:flutter/material.dart';
import 'package:money_app_down/components/home_page.dart';
import 'package:money_app_down/components/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MUPDN',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
          currentIndex: selectedIndex,
          onTap: (selectedIndex) => {changeIndex(selectedIndex)},
        )
      ],
    );
  }
}
