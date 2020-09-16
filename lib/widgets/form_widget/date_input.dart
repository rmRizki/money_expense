import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_expense/models/date_data.dart';
import 'package:money_expense/theme/style.dart';
import 'package:money_expense/theme/svg_assets.dart';
import 'package:provider/provider.dart';

class DateInput extends StatelessWidget {
  const DateInput({
    Key key,
    @required this.dateController,
  }) : super(key: key);

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Tanggal',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Consumer<DateData>(
            builder: (context, dateData, child) {
              dateController.text = dateData.date;
              return TextField(
                onTap: () => openDatePicker(context),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.normal),
                readOnly: true,
                controller: dateController,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.normal, color: lightGrayColor),
                  hintText: 'Senin, 27 Juli 2020',
                  suffixIcon: SvgPicture.asset(
                    SvgAssets.calendar,
                    height: 24.0,
                    width: 24.0,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void openDatePicker(BuildContext context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2018, 7, 7),
        maxTime: DateTime.now(),
        theme: DatePickerTheme(
          doneStyle: TextStyle(color: primaryColor),
        ), onConfirm: (date) {
      Provider.of<DateData>(context, listen: false).setDate(
        date.weekday,
        date.day,
        date.month,
        date.year,
      );
    }, currentTime: DateTime.now(), locale: LocaleType.id);
  }
}
