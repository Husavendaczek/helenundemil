import 'package:flutter/material.dart';
import 'package:helenundemil/models/food_item.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/buffet/buffet.dart';
import 'package:helenundemil/widgets/buffet/long_drinks.dart';
import 'package:helenundemil/widgets/buffet/normal_drinks.dart';
import 'package:helenundemil/widgets/general/my_text.dart';

class BuffetPage extends StatefulWidget {
  const BuffetPage({Key? key}) : super(key: key);

  @override
  _BuffetPageState createState() => _BuffetPageState();
}

class _BuffetPageState extends State<BuffetPage> {
  List<FoodItem> foodItems = [
    new FoodItem(
      translate("buffet.label"),
      Icons.set_meal,
      Buffet(),
    ),
    new FoodItem(
      translate("drinks.normalDrinks.label"),
      Icons.local_drink,
      NormalDrinks(),
    ),
    new FoodItem(
      translate("drinks.longDrinks.label"),
      Icons.local_drink,
      LongDrinks(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            iconColor: AppColors.Accent,
            collapsedIconColor: AppColors.Accent,
            leading: new Icon(
              foodItems[i].icon,
              color: AppColors.Accent,
            ),
            title: MyText(
              text: foodItems[i].title,
              color: AppColors.Accent,
              fontSize: 24,
            ),
            children: <Widget>[
              foodItems[i].content,
            ],
          );
        },
      ),
    );
  }
}
