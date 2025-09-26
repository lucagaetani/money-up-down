import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../database/database.dart';
import '../providers/app_provider.dart';
import '../widgets/pie_chart_widget.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat.yMMMM().format(provider.selectedMonth)),
        actions: [
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              final newMonth = DateTime(provider.selectedMonth.year, provider.selectedMonth.month - 1, 1);
              provider.changeMonth(newMonth);
            },
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              final newMonth = DateTime(provider.selectedMonth.year, provider.selectedMonth.month + 1, 1);
              provider.changeMonth(newMonth);
            },
          ),
        ],
      ),
      body: StreamBuilder<List<TransactionItem>>(
        stream: provider.transactionStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final transactions = snapshot.data ?? [];

          double totalExpenses = transactions
              .where((t) => t.isExpense)
              .fold(0, (sum, item) => sum + item.amount);

          double totalDeposits = transactions
              .where((t) => !t.isExpense)
              .fold(0, (sum, item) => sum + item.amount);

          return Column(
            children: [
              // Monthly Summary
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatCard(title: 'Deposits', amount: totalDeposits, color: Colors.green),
                    StatCard(title: 'Expenses', amount: totalExpenses, color: Colors.red),
                  ],
                ),
              ),
              // Pie Chart
              SizedBox(
                height: 200,
                child: PieChartWidget(transactions: transactions),
              ),
              // Transaction List
              Expanded(
                child: TransactionList(transactions: transactions),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement the Add Transaction Dialog
          // showDialog(context: context, builder: (ctx) => AddTransactionDialog());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final double amount;
  final Color color;

  const StatCard({Key? key, required this.title, required this.amount, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 4),
            Text(
              NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount),
              style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}