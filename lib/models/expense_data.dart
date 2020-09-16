import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:money_expense/db/date_helper.dart';
import 'package:money_expense/models/category_data.dart';
import 'package:money_expense/models/expense.dart';

class ExpenseData extends ChangeNotifier {
  static const String _boxName = 'expenseBox';
  List<Expense> _expenses = [];

  void initExpenses() async {
    var box = await Hive.openBox<Expense>(_boxName);
    _expenses = box.values.toList();
    notifyListeners();
  }

  void saveExpense(Expense expense) async {
    var box = await Hive.openBox<Expense>(_boxName);
    await box.add(expense);
    _expenses = box.values.toList();
    notifyListeners();
  }

  void deleteExpense(expense) async {
    var box = await Hive.openBox<Expense>(_boxName);
    await box.delete(expense.key);
    _expenses = box.values.toList();
    notifyListeners();
  }

  void deleteExpenseByCategory(category) async {
    var box = await Hive.openBox<Expense>(_boxName);
    var filteredExpense = box.values.where(
      (expense) => expense.category.contains(category),
    );
    filteredExpense.forEach((expense) async {
      await box.delete(expense.key);
    });

    _expenses = box.values.toList();
    notifyListeners();
  }

  List<Expense> get expenses {
    return _expenses;
  }

  List<Map> get expenseByCategory {
    List<Map> expenseByCategory = categoryData;

    expenseByCategory.forEach((category) {
      category['totalExpense'] = 0;
      _expenses.forEach((expense) {
        if (category['name'] == expense.category) {
          category['totalExpense'] += expense.nominal;
        }
      });
    });

    expenseByCategory.sort(
      (a, b) => b['totalExpense'].compareTo(a['totalExpense']),
    );

    return expenseByCategory;
  }

  int get dailyNominal {
    var nominal = 0;
    _expenses.forEach((expense) {
      if (DateHelper.checkIfToday(expense.date)) {
        nominal += expense.nominal;
      }
    });
    return nominal;
  }
}
