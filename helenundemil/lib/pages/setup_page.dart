import 'package:flutter/material.dart';
import 'package:helenundemil/models/party_table.dart';
import 'package:helenundemil/models/relationship.dart';
import 'package:helenundemil/pages/menu.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/general/my_text.dart';
import 'package:helenundemil/widgets/settings/language_chooser.dart';
import 'package:helenundemil/widgets/settings/party_table_dropdown.dart';
import 'package:helenundemil/widgets/settings/relationship_dropdown.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  Relationship _relationship = Relationship.friend;
  PartyTable _partyTable = PartyTable.one;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(text: translate("welcome")),
          LanguageChooser(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                text: translate("relationship.label"),
                color: AppColors.Accent,
              ),
              RelationshipDropdown(
                defaultValue: _relationship,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                text: translate("partytable.label"),
                color: AppColors.Accent,
              ),
              PartyTableDropdown(defaultValue: _partyTable),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Menu(title: translate("appTitle"));
              }));
            },
            child: MyText(
              text: translate("save"),
              color: AppColors.White,
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.pressed)) {
                  return AppColors.Secondary;
                }
                return AppColors.Accent;
              }),
            ),
          ),
        ],
      ),
    );
  }
}
