import 'package:flutter/foundation.dart';
import 'package:money_expense/theme/svg_assets.dart';

class CategoryData extends ChangeNotifier {
  Map<String, String> _categoryData = {
    'name': 'Makanan',
    'icon': SvgAssets.pizza,
  };

  void setCategory(name, icon) {
    _categoryData['name'] = name;
    _categoryData['icon'] = icon;
    notifyListeners();
  }

  Map<String, String> get category {
    return _categoryData;
  }
}

List<Map<String, dynamic>> categoryData = [
  {
    'name': 'Makanan',
    'icon': SvgAssets.pizza,
  },
  {
    'name': 'Internet',
    'icon': SvgAssets.signal,
  },
  {
    'name': 'Edukasi',
    'icon': SvgAssets.book,
  },
  {
    'name': 'Hadiah',
    'icon': SvgAssets.gift,
  },
  {
    'name': 'Transport',
    'icon': SvgAssets.car,
  },
  {
    'name': 'Belanja',
    'icon': SvgAssets.shoppingCart,
  },
  {
    'name': 'Alat Rumah',
    'icon': SvgAssets.home,
  },
  {
    'name': 'Olahraga',
    'icon': SvgAssets.basketball,
  },
  {
    'name': 'Hiburan',
    'icon': SvgAssets.clapperBoard,
  },
];
