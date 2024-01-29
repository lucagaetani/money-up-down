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
      height: 220,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondary,
      ),
      child: Center(
        child: 
          FittedBox(
            fit: BoxFit.fitWidth, 
            child: Text("10.9999999€", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),)
          ),
        ),
    );
  }
}