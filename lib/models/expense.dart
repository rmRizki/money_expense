import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 0)
class Expense extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int nominal;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final String category;

  Expense(
      {@required this.name,
      @required this.nominal,
      @required this.date,
      @required this.category});
}
