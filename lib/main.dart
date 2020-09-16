import 'package:flutter/material.dart';
import 'package:money_expense/models/category_data.dart';
import 'package:money_expense/models/date_data.dart';
import 'package:money_expense/models/expense_data.dart';
import 'package:money_expense/routes.dart';
import 'package:money_expense/helpers/db_helper.dart';
import 'package:money_expense/theme/style.dart';
import 'package:provider/provider.dart';

void main() {
  initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryData>(
          create: (context) => CategoryData(),
        ),
        ChangeNotifierProvider<DateData>(
          create: (context) => DateData(),
        ),
        ChangeNotifierProvider<ExpenseData>(
          create: (context) => ExpenseData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: appRoutes,
        title: 'Money Expense',
        theme: appTheme(context),
      ),
    );
  }
}
