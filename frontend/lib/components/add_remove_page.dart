import 'package:flutter/material.dart';

class AddRemovePage extends StatefulWidget {
  final int valueAddOrRemove;

  AddRemovePage({required this.valueAddOrRemove});

  @override
  State createState() => _AddRemovePage();
}

class _AddRemovePage extends State<AddRemovePage> {
  bool dark = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: 
        AppBar(title: Text((widget.valueAddOrRemove == 0) ? "Add" : "Remove")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'How much?',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
            ),
          ),
          Text("Choose a category"),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
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
            ),
          ),
        ],
      )
    );
  }
}