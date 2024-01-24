import 'package:flutter/material.dart';

class AddRemovePage extends StatefulWidget {
  @override
  State createState() => _AddRemovePage();
}

class _AddRemovePage extends State<AddRemovePage> {
  bool dark = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: 
        AppBar(title: Text("New entry")),
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(child: 
                Text("b", style: TextStyle(color: Colors.teal[800], fontSize: 40),
              )
            ),
          ),
        ],
      )
    );
  }
}