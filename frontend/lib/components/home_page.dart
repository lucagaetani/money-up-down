import 'package:flutter/material.dart';
import 'package:frontend/components/add_remove_page.dart';
import 'package:frontend/components/circle_money.dart';
import 'package:frontend/components/expenses_page.dart';
import 'package:frontend/database/database.dart';

class HomePage extends StatefulWidget {
  
  @override
  State createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    List<Map<String, dynamic>> totalSum = await DatabaseHelper.instance.getTotalSum();
    setState(() {
      totalAmount = totalSum[0]['Total'] ?? 0;
    });
  }

  void updateTotalAmount(double newTotalAmount) {
    setState(() {
      totalAmount = newTotalAmount;
    });
  }

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
                    Navigator.of(context).push(_createRoute(1, updateTotalAmount));
                  }, 
                  child: Icon(Icons.remove, size: 30.0, color: Theme.of(context).colorScheme.tertiary,)
                )),
              Center(child: CircleMoney(totalAmount: totalAmount,)),
              Center(child: 
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).push(_createRoute(0, updateTotalAmount));
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

Route _createRoute(int value, Function updateTotalAmount) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AddRemovePage(valueAddOrRemove: value, updateTotalAmount: updateTotalAmount),
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