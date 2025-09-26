import 'package:flutter/material.dart';

import '../database/database.dart';

class AppProvider extends ChangeNotifier {
  final AppDatabase db;
  DateTime selectedMonth = DateTime.now();
  Stream<List<TransactionItem>>? _transactionStream;

  AppProvider({required this.db});

  Stream<List<TransactionItem>> get transactionStream {
    // Only create a new stream if the month has changed
    _transactionStream ??= db.watchTransactionsInMonth(selectedMonth);
    return _transactionStream!;
  }

  void changeMonth(DateTime newMonth) {
    selectedMonth = newMonth;
    // Create a new stream for the new month
    _transactionStream = db.watchTransactionsInMonth(selectedMonth);
    notifyListeners(); // Notify listeners to rebuild and get the new stream
  }

  Future<void> addTransaction(TransactionsCompanion entry) async {
    await db.insertTransaction(entry);
    // The stream will automatically update the UI, no need to call notifyListeners() here.
  }

  Future<void> addCategory(CategoriesCompanion entry) async {
    await db.insertCategory(entry);
    notifyListeners(); // Notify if you have a UI that lists categories
  }

  Future<List<Category>> getAllCategories() {
    return db.getAllCategories();
  }
}