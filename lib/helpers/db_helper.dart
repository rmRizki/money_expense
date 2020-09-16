import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_expense/models/expense.dart';

initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Expense>(ExpenseAdapter());
}
