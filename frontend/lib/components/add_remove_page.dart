import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/category.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class AddRemovePage extends StatefulWidget {
  final int valueAddOrRemove;

  AddRemovePage({required this.valueAddOrRemove});

  @override
  State createState() => _AddRemovePage();
}

class _AddRemovePage extends State<AddRemovePage> {
  bool dark = true;
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
    locale: 'eu',
    decimalDigits: 2,
    symbol: '€',
  );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: 
        AppBar(
          title: Text((widget.valueAddOrRemove == 0) ? "Add" : "Remove"),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
                onPressed: () {
                 
                }, 
                child: widget.valueAddOrRemove == 0 ? Icon(Icons.add) : Icon(Icons.remove),
            ),
          ],
        ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Amount',
              ),
              inputFormatters: <TextInputFormatter>[
                CurrencyTextInputFormatter(
                  locale: 'eu',
                  decimalDigits: 2,
                  symbol: '€',
                ),
              ],
              initialValue: _formatter.format('0.00'),
              keyboardType: TextInputType.number,
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
          Text("Choose a category", style: TextStyle(fontSize: 25),),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              children: [
                Category(
                  title: "Restaurant",
                  color: Colors.teal[800],
                  icon: Icons.restaurant,
                ),
                Category(
                  title: "Bills",
                  color: Colors.red[800],
                  icon: Icons.payments
                ),
                Category(
                  title: "Clothes",
                  color: Colors.orange[800],
                  icon: Icons.checkroom,
                ),
                Category(
                  title: "Entertainment",
                  color: Colors.brown[800],
                  icon: Icons.local_bar,
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}