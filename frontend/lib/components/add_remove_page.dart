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
  int selectedCategoryIndex = -1;
  bool dark = true;
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
    locale: 'eu',
    decimalDigits: 2,
    symbol: '€',
  );
   @override
  Widget build(BuildContext context) {
    List<InkWell> categoriesToRemove = [
        InkWell(
        onTap: () {
          setState(() {
            selectedCategoryIndex = 0;
          });
        },
        child: Category(
          title: "Restaurant",
          color: Colors.teal[800],
          icon: Icons.restaurant,
          border: selectedCategoryIndex == 0 ? Border.all(width: 2.0) : null,
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            selectedCategoryIndex = 1;
          });
        },
        child: Category(
          title: "Bills",
          color: Colors.red[800],
          icon: Icons.payments,
          border: selectedCategoryIndex == 1 ? Border.all(width: 2.0) : null,
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            selectedCategoryIndex = 2;
          });
        },
        child: Category(
          title: "Clothes",
          color: Colors.orange[800],
          icon: Icons.checkroom,
          border: selectedCategoryIndex == 2 ? Border.all(width: 2.0) : null,
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            selectedCategoryIndex = 3;
          });
        },
        child: Category(
          title: "Entertainment",
          color: Colors.brown[800],
          icon: Icons.local_bar,
          border: selectedCategoryIndex == 3 ? Border.all(width: 2.0) : null,
        ),
      ),
    ];

    List<InkWell> categoriesToAdd = [
        InkWell(
        onTap: () {
          setState(() {
            selectedCategoryIndex = 0;
          });
        },
        child: Category(
          title: "Salary",
          color: Colors.teal[800],
          icon: Icons.paid,
          border: selectedCategoryIndex == 0 ? Border.all(width: 2.0) : null,
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            selectedCategoryIndex = 1;
          });
        },
        child: Category(
          title: "Savings",
          color: Colors.red[800],
          icon: Icons.savings,
          border: selectedCategoryIndex == 1 ? Border.all(width: 2.0) : null,
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            selectedCategoryIndex = 2;
          });
        },
        child: Category(
          title: "Free entry",
          color: Colors.orange[800],
          icon: Icons.redeem,
          border: selectedCategoryIndex == 2 ? Border.all(width: 2.0) : null,
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text((widget.valueAddOrRemove == 0) ? "Add" : "Remove"),
        actions: [
          ElevatedButton(
            onPressed: () {

            },
            child: widget.valueAddOrRemove == 0
                ? Icon(Icons.add)
                : Icon(Icons.remove),
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
              children: widget.valueAddOrRemove == 0 ? categoriesToAdd : categoriesToRemove,
            ),
          ),
        ],
      )
    );
  }
}