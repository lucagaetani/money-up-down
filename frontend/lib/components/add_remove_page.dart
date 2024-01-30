import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/category.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:frontend/database/database.dart';

class AddRowClass {
  const AddRowClass();

  Future<void> addRow(BuildContext context, String amountController, String descriptionController, String selectedCategory, int valueAddOrRemove, Function updateTotalAmount) async {
    await DatabaseHelper.instance.insertRow({
                'amount': double.parse(amountController.replaceAll('€', '').replaceAll(',','.')),
                'description': descriptionController,
                'category': selectedCategory,
                'add_or_remove': valueAddOrRemove,
                'date': DateTime.now().microsecondsSinceEpoch,
                'created_at': DateTime.now().microsecondsSinceEpoch,
    });
    List<Map<String, dynamic>> totalSum = await DatabaseHelper.instance.getTotalSum();
    updateTotalAmount(totalSum[0]["Total"] ?? 0);
    if (context.mounted) Navigator.of(context).pop();
  }
}

class AddRemovePage extends StatefulWidget {
  final int valueAddOrRemove;
  final Function updateTotalAmount;

  AddRemovePage({required this.valueAddOrRemove, required this.updateTotalAmount});

  @override
  State createState() => _AddRemovePage();
}

class _AddRemovePage extends State<AddRemovePage> {
  String selectedCategory = "";
  bool dark = true;
  TextEditingController amountController = TextEditingController(
    text: CurrencyTextInputFormatter(
      locale: 'eu',
      decimalDigits: 2,
      symbol: '€',
    ).format('0.00'),
  );
  TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    List<InkWell> categoriesToRemove = [
        InkWell(
        onTap: () {
          setState(() {
            selectedCategory = "Restaurant";
          });
        },
        child: Category(
          title: "Restaurant",
          color: Colors.teal[800],
          icon: Icons.restaurant,
          border: selectedCategory == "Restaurant" ? Border.all(width: 2.0) : null,
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            selectedCategory = "Bills";
          });
        },
        child: Category(
          title: "Bills",
          color: Colors.red[800],
          icon: Icons.payments,
          border: selectedCategory == "Bills" ? Border.all(width: 2.0) : null,
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            selectedCategory = "Clothes";
          });
        },
        child: Category(
          title: "Clothes",
          color: Colors.orange[800],
          icon: Icons.checkroom,
          border: selectedCategory == "Clothes" ? Border.all(width: 2.0) : null,
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            selectedCategory = "Entertainment";
          });
        },
        child: Category(
          title: "Entertainment",
          color: Colors.brown[800],
          icon: Icons.local_bar,
          border: selectedCategory == "Entertainment" ? Border.all(width: 2.0) : null,
        ),
      ),
    ];

    List<InkWell> categoriesToAdd = [
        InkWell(
        onTap: () {
          setState(() {
            selectedCategory = "Salary";
          });
        },
        child: Category(
          title: "Salary",
          color: Colors.teal[800],
          icon: Icons.paid,
          border: selectedCategory == "Salary" ? Border.all(width: 2.0) : null,
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            selectedCategory = "Savings";
          });
        },
        child: Category(
          title: "Savings",
          color: Colors.red[800],
          icon: Icons.savings,
          border: selectedCategory == "Savings" ? Border.all(width: 2.0) : null,
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            selectedCategory = "Free entry";
          });
        },
        child: Category(
          title: "Free entry",
          color: Colors.orange[800],
          icon: Icons.redeem,
          border: selectedCategory == "Free entry" ? Border.all(width: 2.0) : null,
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text((widget.valueAddOrRemove == 0) ? "Add" : "Remove"),
        actions: [
          ElevatedButton(
            onPressed: () {
              const AddRowClass().addRow(context, amountController.text, descriptionController.text, selectedCategory, widget.valueAddOrRemove, widget.updateTotalAmount);
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
              controller: amountController,
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
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: descriptionController,
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