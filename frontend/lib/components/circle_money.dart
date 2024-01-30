import 'dart:developer';

import 'package:flutter/material.dart';

class CircleMoney extends StatefulWidget {
  final double totalAmount;

  CircleMoney({ required this.totalAmount });
  
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
            child: Text(widget.totalAmount > 0 ? widget.totalAmount.toStringAsFixed(2).replaceAll('.', ',') + "€" : "0€", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),)
          ),
        ),
    );
  }
}