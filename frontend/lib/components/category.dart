import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String title;
  final Color? color;
  final IconData? icon;

  Category({required this.title, required this.color, required this.icon});

  @override
  State createState() => _Category();
}

class _Category extends State<Category> {

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
      },
      child: Ink(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: widget.color,
        ),
        child: Column(
          children: [
            Expanded(child: Icon(widget.icon, size: 40, color: Colors.white,)),
            Expanded(
              child: Center(child: 
                  FittedBox(
                    fit: BoxFit.fitWidth, 
                    child: Text(widget.title, style: TextStyle(color: Colors.white),
                                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}