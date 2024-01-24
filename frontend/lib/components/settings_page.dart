import 'package:flutter/material.dart';
import 'package:frontend/components/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  State createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool dark = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: 
        AppBar(title: Text("Settings")),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Switch(value: dark, onChanged: (a) => {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
            setState(() {
              dark = !dark;
            })
          }),
          Center(child: Text(dark ? "Disable dark mode" : "Enable dark mode"))
        ],
      )
    );
  }
}