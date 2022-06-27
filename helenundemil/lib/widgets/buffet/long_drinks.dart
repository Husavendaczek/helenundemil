import 'package:flutter/material.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/general/my_text.dart';

class LongDrinks extends StatefulWidget {
  const LongDrinks({Key? key}) : super(key: key);

  @override
  _LongDrinksState createState() => _LongDrinksState();
}

class _LongDrinksState extends State<LongDrinks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildExpandableContent(
        [
          translate("drinks.longDrinks.moscowMule.label"),
          translate("drinks.longDrinks.moscowMule.text"),
          translate("drinks.longDrinks.ginTonic.label"),
          translate("drinks.longDrinks.ginTonic.text"),
          translate("drinks.longDrinks.cubaLibre.label"),
          translate("drinks.longDrinks.cubaLibre.text"),
          translate("drinks.longDrinks.malibuMaracuja.label"),
          translate("drinks.longDrinks.malibuMaracuja.text"),
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
