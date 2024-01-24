import 'package:flutter/material.dart';
import 'package:frontend/components/circle_money.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(padding: EdgeInsets.all(1));

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: 
              ElevatedButton(
                style: style,
                onPressed: () {}, 
                child: Icon(Icons.remove, size: 30.0, color: Theme.of(context).colorScheme.tertiary,)
              )),
            Center(child: CircleMoney()),
            Center(child: 
              ElevatedButton(
                style: style,
                onPressed: () {}, 
                child: Icon(Icons.add, size: 30.0, color: Theme.of(context).colorScheme.tertiary,)
              )),
          ],
        ),
    );
  }
}