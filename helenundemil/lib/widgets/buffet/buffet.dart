import 'package:flutter/material.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/general/my_text.dart';

class Buffet extends StatefulWidget {
  const Buffet({Key? key}) : super(key: key);

  @override
  _BuffetState createState() => _BuffetState();
}

class _BuffetState extends State<Buffet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildExpandableContent(
        [
          translate("buffet.entree.label"),
          translate("buffet.entree.text.item1"),
          translate("buffet.entree.text.item2"),
          translate("buffet.entree.text.item3"),
          translate("buffet.entree.text.item4"),
          translate("buffet.main.label"),
          translate("buffet.main.text.item1"),
          translate("buffet.main.text.item2"),
          translate("buffet.main.text.item3"),
          translate("buffet.main.text.item4"),
          translate("buffet.desert.label"),
          translate("buffet.desert.text.item1"),
          translate("buffet.desert.text.item2"),
          translate("buffet.desert.text.item3"),
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
