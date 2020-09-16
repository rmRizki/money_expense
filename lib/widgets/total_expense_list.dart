import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:money_expense/helpers/format_helper.dart';
import 'package:money_expense/models/date_data.dart';
import 'package:money_expense/models/expense_data.dart';
import 'package:money_expense/theme/style.dart';
import 'package:provider/provider.dart';

class TotalExpenseList extends StatelessWidget {
  const TotalExpenseList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      duration: Duration(seconds: 1),
      child: FadeInAnimation(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          height: 334.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 8.0,
                spreadRadius: 4.0,
                offset: Offset(0, 4.0),
              )
            ],
            color: Colors.white,
          ),
          child: Consumer<ExpenseData>(
            builder: (context, expenseData, child) {
              var expenses = expenseData.expenses;

              return expenses.isEmpty
                  ? Center(child: Text('Data Kosong'))
                  : GroupedListView<dynamic, String>(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        top: 15.0,
                        right: 15.0,
                        bottom: 22.0,
                      ),
                      elements: expenses,
                      groupBy: (expense) {
                        var date = context
                            .read<DateData>()
                            .getOrderFromDateString(expense.date);
                        return '$date';
                      },
                      groupHeaderBuilder: (expense) {
                        var date = context
                            .read<DateData>()
                            .getDateString(expense.date);

                        return Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            date,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        );
                      },
                      itemBuilder: (context, expense) {
                        var icon = FormatHelper.getIcon(expense.category);
                        var nominal = FormatHelper.toMoneyCurrency(
                          expense.nominal,
                          locale: 'id',
                        );

                        return Container(
                          margin: EdgeInsets.only(bottom: 4.0),
                          child: ListTile(
                            onTap: () => _showToast(),
                            onLongPress: () => _showDialog(
                              context,
                              expense,
                              nominal,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            leading: Container(
                              height: 36.0,
                              width: 36.0,
                              child: SvgPicture.asset(
                                icon,
                                color: iconColor,
                                fit: BoxFit.scaleDown,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: mainBgColor,
                              ),
                            ),
                            title: Text(
                              expense.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                            trailing: Text(
                              'Rp. $nominal',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                        );
                        // return Text(expense.name);
                      },
                      order: GroupedListOrder.DESC,
                    );
            },
          ),
        ),
      ),
    );
  }

  _showToast() {
    Fluttertoast.showToast(
        msg: "Tahan untuk melihat/menghapus pengeluaran",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 12.0);
  }

  _showDialog(context, expense, nominal) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        var textStyle = Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.normal);

        return AlertDialog(
          title: Text('Detail Pengeluaran'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  'Nama Pengeluaran : ${expense.name}',
                  style: textStyle,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Kategori : ${expense.category}',
                  style: textStyle,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Nominal : Rp. $nominal',
                  style: textStyle,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Tanggal : ${expense.date}',
                  style: textStyle,
                ),
              ],
            ),
          ),
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
                    .deleteExpense(expense);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
