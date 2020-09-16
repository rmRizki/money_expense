import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_expense/models/category_data.dart';
import 'package:money_expense/theme/style.dart';
import 'package:money_expense/theme/svg_assets.dart';
import 'package:provider/provider.dart';

class ChooseCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(top: 24.0, left: 28.0, right: 28.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pilih Kategori',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(SvgAssets.close),
                )
              ],
            ),
            SizedBox(
              height: 27.0,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 22.0,
                ),
                itemCount: categoryData.length,
                itemBuilder: (context, index) {
                  var categoryName = categoryData[index]['name'];
                  var categoryIcon = categoryData[index]['icon'];
                  return GestureDetector(
                    onTap: () {
                      Provider.of<CategoryData>(context, listen: false)
                          .setCategory(
                        categoryName,
                        categoryIcon,
                      );
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 42.0,
                          width: 42.0,
                          margin: EdgeInsets.only(bottom: 8.0),
                          padding: EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            categoryIcon,
                            color: iconColor,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mainBgColor,
                          ),
                        ),
                        Text(
                          categoryName,
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.normal, color: grayColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
