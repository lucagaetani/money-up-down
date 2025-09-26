import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';

class PieChartWidget extends StatelessWidget {
  final List<TransactionItem> transactions;

  const PieChartWidget({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1. Filter for expenses and group by category
    final expenseTransactions = transactions.where((t) => t.isExpense).toList();
    final Map<int, double> categoryTotals = {};

    for (var transaction in expenseTransactions) {
      categoryTotals.update(
        transaction.categoryId,
            (value) => value + transaction.amount,
        ifAbsent: () => transaction.amount,
      );
    }

    if (categoryTotals.isEmpty) {
      return Center(child: Text("No expenses to show in chart."));
    }

    // 2. Convert map to PieChartSectionData
    final List<PieChartSectionData> sections = categoryTotals.entries.map((entry) {
      // In a real app, you would fetch the category name and color from the DB
      // For simplicity, we'll use placeholder data here.
      final categoryId = entry.key;
      final total = entry.value;

      return PieChartSectionData(
        value: total,
        title: '\$${total.toStringAsFixed(0)}',
        // color: Colors.primaries[categoryId % Colors.primaries.length],
        radius: 60,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      );
    }).toList();

    return PieChart(
      PieChartData(
        sections: sections,
        centerSpaceRadius: 40,
        sectionsSpace: 2,
      ),
    );
  }
}