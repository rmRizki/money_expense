import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_expense/models/category_data.dart';
import 'package:money_expense/screens/choose_category.dart';
import 'package:money_expense/theme/style.dart';
import 'package:money_expense/theme/svg_assets.dart';
import 'package:provider/provider.dart';

class CategoryInput extends StatelessWidget {
  const CategoryInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12.0),
            child: Text(
              'Kategori',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Consumer<CategoryData>(
            builder: (context, categoryData, child) {
              var category = categoryData.category;
              return ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                      child: ChooseCategory(),
                    ),
                  );
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                trailing: Container(
                  height: 32.0,
                  width: 32.0,
                  padding: EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    SvgAssets.arrowRight,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: mainBgColor,
                  ),
                ),
                leading: Container(
                  height: 42.0,
                  width: 42.0,
                  padding: EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    category['icon'],
                    color: iconColor,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: mainBgColor,
                  ),
                ),
                title: Text(
                  category['name'],
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
