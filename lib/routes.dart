import 'package:flutter/widgets.dart';
import 'package:money_expense/screens/add_expense_screen.dart';
import 'package:money_expense/screens/home_screen.dart';

final Map<String, WidgetBuilder> appRoutes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/addExpense": (BuildContext context) => AddExpenseScreen(),
};
