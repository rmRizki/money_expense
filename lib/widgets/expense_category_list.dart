import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_expense/helpers/format_helper.dart';
import 'package:money_expense/models/expense_data.dart';
import 'package:money_expense/theme/style.dart';
import 'package:money_expense/widgets/expense_category_card.dart';
import 'package:provider/provider.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: Consumer<ExpenseData>(
        builder: (context, expenseData, child) {
          List<Map> expenseByCategory = expenseData.expenseByCategory;
          return AnimationLimiter(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 30.0, bottom: 30.0, right: 20.0),
              scrollDirection: Axis.horizontal,
              itemCount: expenseByCategory.length,
              itemBuilder: (context, index) {
                var name = expenseByCategory[index]['name'];
                var expense = FormatHelper.toMoneyCurrency(
                  expenseByCategory[index]['totalExpense'],
                  locale: 'id',
                );
                var icon = expenseByCategory[index]['icon'];

                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: Duration(seconds: 2),
                  child: SlideAnimation(
                    horizontalOffset: 80.0,
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () => _showToast(
                          "Tahan untuk menghapus semua pengeluaran dengan kategori ini",
                        ),
                        onLongPress: () {
                          if (expense == '0') {
                            _showToast(
                              "Data kategori ${name.toLowerCase()} masih kosong",
                            );
                          } else {
                            return _showDialog(context, name);
                          }
                        },
                        child: ExpenseCategoryCard(
                          category: name,
                          expense: 'Rp. $expense',
                          iconName: icon,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  _showToast(text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 12.0);
  }

  _showDialog(context, category) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        var textStyle = Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.normal);

        return AlertDialog(
          title: Text('Hapus Pengeluaran'),
          content: Text(
              'Apakah ada yakin ingin menghapus semua data pengeluaran dengan kategori $category?'),
          actions: [
            FlatButton(
              child: Text(
                'Kembali',
                style: textStyle.copyWith(color: primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Hapus',
                style: textStyle.copyWith(color: Colors.red),
              ),
              onPressed: () {
                Provider.of<ExpenseData>(context, listen: false)
                    .deleteExpenseByCategory(category);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
