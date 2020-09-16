import 'package:flutter/material.dart';
import 'package:money_expense/theme/style.dart';

class NameInput extends StatelessWidget {
  const NameInput({
    Key key,
    @required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

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
              'Nama pengeluaran',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.normal,
                    color: lightGrayColor,
                  ),
              hintText: 'Nasi Goreng',
            ),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
