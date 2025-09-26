import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

import '../database/database.dart'; // Add this import

class TransactionList extends StatelessWidget {
  final List<TransactionItem> transactions;

  const TransactionList({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Group transactions by day
    final groupedTransactions = groupBy(
      transactions,
          (TransactionItem t) => DateTime(t.transactionDate.year, t.transactionDate.month, t.transactionDate.day),
    );

    if (transactions.isEmpty) {
      return Center(child: Text("No transactions this month."));
    }

    final sortedKeys = groupedTransactions.keys.toList()..sort((a, b) => b.compareTo(a));

    return ListView.builder(
      itemCount: sortedKeys.length,
      itemBuilder: (context, index) {
        final date = sortedKeys[index];
        final dayTransactions = groupedTransactions[date]!;

        final dailyTotal = dayTransactions.fold(0.0, (sum, item) {
          return item.isExpense ? sum - item.amount : sum + item.amount;
        });

        return Card(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat.yMMMd().format(date), style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  NumberFormat.currency(locale: 'en_US', symbol: '\$').format(dailyTotal),
                  style: TextStyle(color: dailyTotal >= 0 ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            children: dayTransactions.map((tx) {
              return ListTile(
                leading: Icon(tx.isExpense ? Icons.arrow_downward : Icons.arrow_upward, color: tx.isExpense ? Colors.red : Colors.green),
                title: Text(tx.description),
                // In a real app, you would fetch the category name here
                subtitle: Text("Category ID: ${tx.categoryId}"),
                trailing: Text(
                  NumberFormat.currency(locale: 'en_US', symbol: '\$').format(tx.amount),
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}