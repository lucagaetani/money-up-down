import 'package:flutter/material.dart';
import 'package:money_app_down/components/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  State createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool light = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: 
        AppBar(title: Text("Settings")),
      body: Switch(value: light, onChanged: (a) => {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
            setState(() {
              light = !light;
            })
          })
    );
  }
}