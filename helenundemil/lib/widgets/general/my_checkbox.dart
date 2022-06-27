import 'package:flutter/material.dart';
import 'package:helenundemil/models/challenge.dart';
import 'package:helenundemil/usecases/resolve_qr_code_usecase.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/general/my_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCheckbox extends StatefulWidget {
  final Challenge challenge;
  final Color color;

  const MyCheckbox({Key? key, required this.challenge, required this.color})
      : super(key: key);

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  final ResolveQRCodeUseCase _resolveQRCodeUseCase = ResolveQRCodeUseCase();
  bool _isChecked = false;

  @override
  void initState() {
    _loadCheckbox();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MyCheckbox oldWidget) {
    _loadCheckbox();
    super.didUpdateWidget(oldWidget);
  }

  void _loadCheckbox() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _isChecked = prefs.getBool(widget.challenge.prefKey) ?? false;
    });
  }

  void _setCheckbox(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isChecked = value;
    });
    await prefs.setBool(widget.challenge.prefKey, _isChecked);
    var date = DateTime.now().toString();
    var key = widget.challenge.prefKey + 'Time';
    await prefs.setString(key, date);
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      onChanged: _isChecked ? null : _setOnChanged(),
      activeColor: AppColors.Accent,
      fillColor: MaterialStateProperty.all(widget.color),
    );
  }

  Function(bool?)? _setOnChanged() {
    return (bool? value) {
      if (widget.challenge.challengeCondition == ChallengeCondition.thing) {
        _openScannerForThing();
      } else {
        _openScannerWithPersonType(widget.challenge.challengeCondition);
      }
    };
  }

  Future<void> _openScannerWithPersonType(ChallengeCondition condition) async {
    var success =
        await _resolveQRCodeUseCase.openScannerForPersonWithPersonType(
            widget.challenge.prefKey, condition);
    _handleAlert(success);
  }

  Future<void> _openScannerForThing() async {
    var success = await _resolveQRCodeUseCase.openScannerForThing();
    _handleAlert(success);
  }

  void _handleAlert(bool success) {
    if (success) {
      showSuccessAlertDialog(context);
    } else {
      showErrorAlertDialog(context);
    }
  }

  showSuccessAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: MyText(text: translate("challenge.ok")),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        _setCheckbox(true);
        _loadCheckbox();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: MyText(
        text: translate("challenge.success.title"),
      ),
      content: MyText(text: translate("challenge.success.text")),
      actions: [
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

  showErrorAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: MyText(text: translate("challenge.ok")),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: MyText(
        text: translate("challenge.error.title"),
      ),
      content: MyText(text: translate("challenge.error.text")),
      actions: [
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
