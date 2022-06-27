import 'package:flutter/material.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/general/my_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChooser extends StatefulWidget {
  const LanguageChooser({Key? key}) : super(key: key);

  @override
  _LanguageChooserState createState() => _LanguageChooserState();
}

class _LanguageChooserState extends State<LanguageChooser> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(child: MyText(text: translate('chooseLanguage'))),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: _setGerman,
              icon: Image.asset("assets/images/german_flag.png")),
          IconButton(
              onPressed: _setPolish,
              icon: Image.asset("assets/images/polish_flag.png")),
        ],
      )
    ]);
  }

  void _setGerman() async {
    changeLocale(context, 'de');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nationality', 'deutsch');
  }

  void _setPolish() async {
    changeLocale(context, 'pl');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nationality', 'polnisch');
  }
}
