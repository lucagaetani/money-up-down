import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/database.dart'; // Import this

class AppProvider extends ChangeNotifier {
  final AppDatabase db;
  DateTime selectedMonth = DateTime.now();
  Stream<List<TransactionItem>>? _transactionStream;

  // --- Theme State ---
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  AppProvider({required this.db}) {
    _loadTheme(); // Load saved theme preference on startup
  }

  // Method to load theme preference from shared_preferences
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false; // Default to light mode
    notifyListeners();
  }

  // Method to toggle theme and save the preference
  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }
  // --- End Theme State ---

  Stream<List<TransactionItem>> get transactionStream {
    _transactionStream ??= db.watchTransactionsInMonth(selectedMonth);
    return _transactionStream!;
  }

  void changeMonth(DateTime newMonth) {
    selectedMonth = newMonth;
    _transactionStream = db.watchTransactionsInMonth(selectedMonth);
    notifyListeners();
  }

  Future<void> addTransaction(TransactionsCompanion entry) async {
    await db.insertTransaction(entry);
  }

  Future<void> addCategory(CategoriesCompanion entry) async {
    await db.insertCategory(entry);
    notifyListeners();
  }

  Future<List<Category>> getAllCategories() {
    return db.getAllCategories();
  }
}