import 'package:flutter/material.dart';
import 'package:helenundemil/pages/edit_settings_page.dart';
import 'package:helenundemil/pages/show_settings_page.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/widgets/general/my_icon.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ShowSettingsPage();
            }));
          },
          icon: MyIcon(
            iconData: Icons.settings,
            color: AppColors.White,
          ),
        ),
      ]),
    );
  }

  void openSettingsPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EditSettingsPage();
    }));
  }
}
