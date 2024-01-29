import 'package:flutter/material.dart';
import 'package:frontend/components/add_remove_page.dart';
import 'package:frontend/components/circle_money.dart';
import 'package:frontend/components/expenses_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(padding: EdgeInsets.all(1));

    return PageView(
      children: [
        Container(
        color: Theme.of(context).colorScheme.background,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: 
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).push(_createRoute(1));
                  }, 
                  child: Icon(Icons.remove, size: 30.0, color: Theme.of(context).colorScheme.tertiary,)
                )),
              Center(child: CircleMoney()),
              Center(child: 
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).push(_createRoute(0));
                  }, 
                  child: Icon(Icons.add, size: 30.0, color: Theme.of(context).colorScheme.tertiary,)
                )),
            ],
          ),
      ),
      ExpensesPage(),
    ]
    );
  }
}

Route _createRoute(int value) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AddRemovePage(valueAddOrRemove: value),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}