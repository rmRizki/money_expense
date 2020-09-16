import 'package:intl/intl.dart';
import 'package:money_expense/models/category_data.dart';

class FormatHelper {
  static String toMoneyCurrency(nominal, {locale = 'en_us'}) {
    return NumberFormat.currency(
      locale: locale,
      symbol: '',
      decimalDigits: 0,
    ).format(nominal);
  }

  static String getIcon(category) {
    var filteredCategory = categoryData
        .where((element) => element.containsValue(category))
        .toList()
        .first;
    return filteredCategory['icon'];
  }
}
