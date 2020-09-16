import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_expense/theme/style.dart';

class NominalInput extends StatelessWidget {
  const NominalInput({
    Key key,
    @required this.nominalController,
  }) : super(key: key);

  final TextEditingController nominalController;

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
              'Nominal',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          TextField(
            controller: nominalController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(),
              prefixStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.normal, color: Colors.transparent),
              prefixIcon: Text('Rp. '),
              hintStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.normal, color: lightGrayColor),
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
