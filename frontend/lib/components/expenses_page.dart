import 'package:flutter/material.dart';
import 'package:frontend/components/theme_provider.dart';
import 'package:provider/provider.dart';

class ExpensesPage extends StatefulWidget {
  @override
  State createState() => _ExpensesPage();
}

class _ExpensesPage extends State<ExpensesPage> {
  bool dark = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Text("a"),)
    );
  }
}