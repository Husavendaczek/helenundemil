import 'package:flutter/material.dart';
import 'package:helenundemil/pages/buffet_page.dart';
import 'package:helenundemil/pages/challenges_page.dart';
import 'package:helenundemil/pages/own_qr_code.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/general/my_icon.dart';
import 'package:helenundemil/widgets/general/my_text.dart';
import 'package:helenundemil/widgets/settings/settings_button.dart';

class Menu extends StatefulWidget {
  final String title;

  const Menu({Key? key, required this.title}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions() {
    return <Widget>[BuffetPage(), ChallengesPage(), OwnQRCode()];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: widget.title,
          color: AppColors.White,
        ),
        backgroundColor: AppColors.Secondary,
        actions: [SettingsButton()],
      ),
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: MyIcon(
                iconData: Icons.menu_book,
                color:
                    _selectedIndex == 0 ? AppColors.Accent : AppColors.Primary,
              ),
              label: translate("menu")),
          BottomNavigationBarItem(
              icon: MyIcon(
                iconData: Icons.checklist,
                color:
                    _selectedIndex == 1 ? AppColors.Accent : AppColors.Primary,
              ),
              label: translate("challenges")),
          BottomNavigationBarItem(
              icon: MyIcon(
                iconData: Icons.qr_code,
                color:
                    _selectedIndex == 2 ? AppColors.Accent : AppColors.Primary,
              ),
              label: translate("qrCode.menu_item"))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.Accent,
        unselectedItemColor: AppColors.Primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
