import 'package:flutter/material.dart';
import 'package:helenundemil/models/nationality.dart';
import 'package:helenundemil/pages/menu.dart';
import 'package:helenundemil/pages/setup_page.dart';
import 'package:helenundemil/usecases/get_own_guest_data_usecase.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _MyStartPageState createState() => _MyStartPageState();
}

class _MyStartPageState extends State<LandingPage> {
  bool dataExists = false;
  GetOwnGuestDataUseCase getOwnGuestDataUseCase = GetOwnGuestDataUseCase();

  @override
  void initState() {
    _dataExists();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helen & Emil',
      home: _getHome(),
    );
  }

  Widget _getHome() {
    if (dataExists) {
      return Menu(
        title: translate('appTitle'),
      );
    } else {
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
    }
  }

  Future<void> _dataExists() async {
    var tmp = await getOwnGuestDataUseCase.dataExists();

    if (tmp) {
      _setLanguage();
    }

    setState(() {
      dataExists = tmp;
    });
  }

  Future<void> _setLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final language = prefs.getString('nationality') ?? '';
    Nationality nationality = language.mapToNationality();
    if (nationality == Nationality.polish) {
      changeLocale(context, 'pl');
    } else {
      changeLocale(context, 'de');
    }
  }
}
