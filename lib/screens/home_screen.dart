import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_expense/theme/svg_assets.dart';
import 'package:money_expense/widgets/expense_category_list.dart';
import 'package:money_expense/widgets/main_app_bar.dart';
import 'package:money_expense/widgets/total_expense_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(),
        preferredSize: Size.fromHeight(0),
      ),
      body: ListView(
        children: [
          MainAppBar(),
          AnimationConfiguration.synchronized(
            duration: Duration(seconds: 1),
            child: FadeInAnimation(
              child: Container(
                padding: EdgeInsets.only(
                  top: 22.0,
                  left: 20.0,
                ),
                child: Text(
                  'Pengeluaran berdasarkan kategori',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
          ExpenseCategoryList(),
          AnimationConfiguration.synchronized(
            duration: Duration(seconds: 1),
            child: FadeInAnimation(
              child: Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  bottom: 24.0,
                ),
                child: Text(
                  'Semua Pengeluaran',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
          TotalExpenseList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addExpense'),
        child: SvgPicture.asset(SvgAssets.add),
        elevation: 8.0,
        highlightElevation: 0,
      ),
    );
  }
}
