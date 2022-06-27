import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helenundemil/models/guest.dart';
import 'package:helenundemil/models/nationality.dart';
import 'package:helenundemil/models/party_table.dart';
import 'package:helenundemil/models/relationship.dart';
import 'package:helenundemil/pages/edit_settings_page.dart';
import 'package:helenundemil/pages/setup_page.dart';
import 'package:helenundemil/usecases/delete_guest_usecase.dart';
import 'package:helenundemil/usecases/get_own_guest_data_usecase.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/general/my_text.dart';
import 'package:helenundemil/widgets/settings/save_json_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowSettingsPage extends StatefulWidget {
  const ShowSettingsPage({Key? key}) : super(key: key);

  @override
  _ShowSettingsPageState createState() => _ShowSettingsPageState();
}

class _ShowSettingsPageState extends State<ShowSettingsPage> {
  Relationship _relationship = Relationship.friend;
  Nationality _nationality = Nationality.german;
  PartyTable _partyTable = PartyTable.one;

  @override
  void initState() {
    _loadGuestData();

    super.initState();
  }

  void _loadGuestData() async {
    GetOwnGuestDataUseCase _getOwnGuestDataUseCase = GetOwnGuestDataUseCase();
    Guest guest = await _getOwnGuestDataUseCase.getOwnGuestData();

    setState(() {
      _nationality = guest.nationality;
      _relationship = guest.relationship;
      _partyTable = guest.partyTable;
    });
  }

  @override
  Widget build(BuildContext context) {
    var relationshipDescription = translate("relationship.label") +
        translate(_relationship.relToTranslateString());
    var partyTableDescription = translate("partytable.label") +
        translate(_partyTable.tabToTranslateString());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate("settings"),
          style: TextStyle(
              color: AppColors.Primary, fontSize: 34, fontFamily: 'CrimsonPro'),
        ),
        backgroundColor: AppColors.White,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.Primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _getLanguage(),
            MyText(
              text: relationshipDescription,
              color: AppColors.Accent,
            ),
            MyText(
              text: partyTableDescription,
              color: AppColors.Accent,
            ),
            MyText(text: translate("warningSaveSettings")),
            TextButton(
                onPressed: () =>
                    showAlertDialog(context, translate("changeData")),
                child: MyText(text: translate("changeData"))),
            TextButton(
                onPressed: () =>
                    showAlertDialog(context, translate("deleteData")),
                child: MyText(text: translate("deleteData"))),
            SaveJsonButton(),
            _showPrivacyPolicy(),
          ],
        ),
      ),
    );
  }

  Widget _showPrivacyPolicy() => Container(
      child: InkWell(
          child: MyText(text: translate("privacyPolicy")),
          onTap: () => launch("https://helenundemil.de/#/privacypolicy")));

  Widget _getLanguage() {
    if (_nationality == Nationality.polish) {
      return Image.asset("assets/images/polish_flag.png", width: 50);
    } else {
      return Image.asset("assets/images/german_flag.png", width: 50);
    }
  }

  showAlertDialog(BuildContext context, String text) {
    // set up the button
    Widget okButton = TextButton(
      child: MyText(text: text),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return EditSettingsPage();
        }));
      },
    );

    Widget cancelButton = TextButton(
      child: MyText(text: translate("cancel")),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: MyText(
        text: translate("changeData"),
      ),
      content: MyText(text: translate("warningSaveSettings")),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showDeleteAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: MyText(text: translate("deleteData")),
      onPressed: () {
        DeleteGuestDataUseCase _deleteGuestDataUseCase =
            DeleteGuestDataUseCase();
        _deleteGuestDataUseCase.deleteOwnGuestData();
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  translate('appTitle'),
                  style: TextStyle(
                      color: AppColors.Secondary,
                      fontSize: 34,
                      fontFamily: 'CrimsonPro'),
                ),
                backgroundColor: AppColors.White,
              ),
              body: SetupPage());
        }));
      },
    );

    Widget cancelButton = TextButton(
      child: MyText(text: translate("cancel")),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: MyText(
        text: translate("changeData"),
      ),
      content: MyText(text: translate("warningSaveSettings")),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
