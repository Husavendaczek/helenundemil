import 'package:flutter/material.dart';
import 'package:helenundemil/models/party_table.dart';
import 'package:helenundemil/models/relationship.dart';
import 'package:helenundemil/pages/menu.dart';
import 'package:helenundemil/usecases/delete_guest_usecase.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/general/my_text.dart';
import 'package:helenundemil/widgets/settings/language_chooser.dart';
import 'package:helenundemil/widgets/settings/party_table_dropdown.dart';
import 'package:helenundemil/widgets/settings/relationship_dropdown.dart';

class EditSettingsPage extends StatefulWidget {
  const EditSettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<EditSettingsPage> {
  Relationship _relationship = Relationship.friend;
  PartyTable _partyTable = PartyTable.one;

  @override
  void initState() {
    DeleteGuestDataUseCase _deleteGuestDataUseCase = DeleteGuestDataUseCase();
    _deleteGuestDataUseCase.deleteOwnGuestData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate("setup"),
          style: TextStyle(
              color: AppColors.Primary, fontSize: 34, fontFamily: 'CrimsonPro'),
        ),
        backgroundColor: AppColors.White,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Menu(title: translate("appTitle"));
                }));
              },
              child: MyText(text: translate("save")),
            ),
          ],
        ),
      ),
    );
  }
}
