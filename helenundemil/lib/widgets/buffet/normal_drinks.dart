import 'package:flutter/material.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/general/my_text.dart';

class NormalDrinks extends StatefulWidget {
  const NormalDrinks({Key? key}) : super(key: key);

  @override
  _NormalDrinksState createState() => _NormalDrinksState();
}

class _NormalDrinksState extends State<NormalDrinks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildExpandableContent(
        [
          translate("drinks.normalDrinks.label"),
          translate("drinks.normalDrinks.text.item1"),
          translate("drinks.normalDrinks.text.item2"),
          translate("drinks.normalDrinks.text.item3"),
          translate("drinks.normalDrinks.text.item4"),
          translate("drinks.beer.label"),
          translate("drinks.beer.text.item1"),
          translate("drinks.beer.text.item2"),
          translate("drinks.beer.text.item3"),
          translate("drinks.beer.text.item4"),
          translate("drinks.beer.text.item5"),
          translate("drinks.beer.text.item6"),
          translate("drinks.beer.text.item7"),
          translate("drinks.whiteWine.label"),
          translate("drinks.whiteWine.text.item1"),
          translate("drinks.whiteWine.text.item2"),
          translate("drinks.redWine.label"),
          translate("drinks.redWine.text"),
        ],
      ),
    );
  }

  List<Widget> _buildExpandableContent(List<String> items) {
    List<Widget> columnContent = [];

    for (String item in items)
      columnContent.add(
        new ListTile(title: MyText(text: item)),
      );

    return columnContent;
  }
}
