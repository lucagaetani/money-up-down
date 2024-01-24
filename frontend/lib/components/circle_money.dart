import 'package:flutter/material.dart';

class CircleMoney extends StatefulWidget {
  @override
  State createState() => _CircleMoney();
}

class _CircleMoney extends State<CircleMoney> {
  bool light = true;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 220,
      height: 180,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).colorScheme.secondary,
      ),
      child: Center(child: 
          Text("b", style: TextStyle(color: Colors.teal[800], fontSize: 40),
        )
      ),
    );
  }
}