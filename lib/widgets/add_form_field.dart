import 'package:flutter/material.dart';
import 'package:money_expense/models/category_data.dart';
import 'package:money_expense/models/expense.dart';
import 'package:money_expense/models/expense_data.dart';
import 'package:money_expense/widgets/form_widget/category_input.dart';
import 'package:money_expense/widgets/form_widget/date_input.dart';
import 'package:money_expense/widgets/form_widget/name_input.dart';
import 'package:money_expense/widgets/form_widget/nominal_input.dart';
import 'package:provider/provider.dart';

class AddFormField extends StatefulWidget {
  @override
  _AddFormFieldState createState() => _AddFormFieldState();
}

class _AddFormFieldState extends State<AddFormField> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 28.0),
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 24.0,
        ),
        Text(
          'Tambah pengeluaran \nbaru',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 52.0,
        ),
        NameInput(nameController: _nameController),
        CategoryInput(),
        DateInput(dateController: _dateController),
        NominalInput(nominalController: _nominalController),
        Container(
          margin: EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 8.0,
                spreadRadius: 4.0,
                offset: Offset(0, 4.0),
              )
            ],
            color: Theme.of(context).primaryColor,
          ),
          child: FlatButton(
            onPressed: () {
              _saveExpense(context);
            },
            child: Text(
              'Simpan',
              style: Theme.of(context).textTheme.button,
            ),
          ),
        )
      ],
    );
  }

  _saveExpense(BuildContext context) {
    var name = _nameController.text;
    var date = _dateController.text;
    var nominalString = _nominalController.text;

    if (name.isEmpty || date.isEmpty || nominalString.isEmpty) {
      _showDialog('Data masih belum lengkap');
    } else if (nominalString == '0') {
      _showDialog('Nominal tidak boleh bernilai 0');
    } else {
      var category = Provider.of<CategoryData>(context, listen: false).category;
      var nominal = int.parse(nominalString);

      Provider.of<ExpenseData>(context, listen: false).saveExpense(
        Expense(
          name: name,
          nominal: nominal,
          date: date,
          category: category['name'],
        ),
      );
      Navigator.of(context).pop();
    }
  }

  _showDialog(text) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text('Oke'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  dispose() {
    _nameController.dispose();
    _nominalController.dispose();
    _dateController.dispose();

    super.dispose();
  }
}
