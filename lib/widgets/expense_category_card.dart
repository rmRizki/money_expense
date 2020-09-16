import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_expense/theme/style.dart';

class ExpenseCategoryCard extends StatelessWidget {
  ExpenseCategoryCard({
    @required this.category,
    @required this.expense,
    @required this.iconName,
  });

  final String category;
  final String expense;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                iconName,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            category,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.normal, color: grayColor),
          ),
          SizedBox(
            height: 7.0,
          ),
          Text(
            expense,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 20.0),
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            blurRadius: 8.0,
            spreadRadius: 4.0,
            offset: Offset(0, 4.0),
          )
        ],
        color: Colors.white,
      ),
    );
  }
}
