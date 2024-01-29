import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  final Color? color;
  final IconData? icon;
  final Border? border;

  Category({required this.title, required this.color, required this.icon, required this.border});

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: border,
        shape: BoxShape.rectangle,
        color: color,
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.white),
          FittedBox(
            fit: BoxFit.fitWidth, 
            child: Text(title, style: TextStyle(color: Colors.white),)
          ),
        ],
      ),
    );
  }
}