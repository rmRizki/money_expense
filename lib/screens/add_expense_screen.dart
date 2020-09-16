import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_expense/theme/svg_assets.dart';
import 'package:money_expense/widgets/add_form_field.dart';

class AddExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.0, top: 44.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(SvgAssets.back),
              ),
            ),
            Expanded(
              child: AddFormField(),
            ),
          ],
        ),
      ),
    );
  }
}
