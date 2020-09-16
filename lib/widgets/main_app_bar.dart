import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_expense/helpers/format_helper.dart';
import 'package:money_expense/models/expense_data.dart';
import 'package:money_expense/theme/svg_assets.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 202.0,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(top: 40.0, left: 20.0),
      child: AnimationConfiguration.synchronized(
        duration: Duration(seconds: 2),
        child: FadeInAnimation(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: SvgPicture.asset(SvgAssets.user),
                radius: 32.0,
                backgroundColor: Color(0xFF333333).withOpacity(0.2),
              ),
              SizedBox(
                height: 17.0,
              ),
              Text(
                'Pengeluaran Anda hari ini',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5.0,
              ),
              Consumer<ExpenseData>(
                builder: (context, expenseData, child) {
                  var nominal =
                      FormatHelper.toMoneyCurrency(expenseData.dailyNominal);
                  return Text(
                    'Rp. $nominal',
                    style: Theme.of(context).textTheme.headline5,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
