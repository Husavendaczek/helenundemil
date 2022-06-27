import 'package:flutter/material.dart';
import 'package:helenundemil/models/party_table.dart';
import 'package:helenundemil/widgets/general/my_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PartyTableDropdown extends StatefulWidget {
  final PartyTable defaultValue;
  const PartyTableDropdown({Key? key, required this.defaultValue})
      : super(key: key);

  @override
  _PartyTableDropdownState createState() => _PartyTableDropdownState();
}

class _PartyTableDropdownState extends State<PartyTableDropdown> {
  PartyTable partyTable = PartyTable.one;

  @override
  void initState() {
    _setPartyTable(widget.defaultValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<PartyTable>(
      value: partyTable,
      items: _getDropDownItems(),
      onChanged: (PartyTable? newValue) {
        _setPartyTable(newValue ?? widget.defaultValue);
        setState(() {
          partyTable = newValue!;
        });
      },
    );
  }

  List<DropdownMenuItem<PartyTable>> _getDropDownItems() {
    return PartyTable.values
        .map<DropdownMenuItem<PartyTable>>((PartyTable value) {
      return DropdownMenuItem<PartyTable>(
        value: value,
        child: MyText(text: value.tabToTranslateString()),
      );
    }).toList();
  }

  void _setPartyTable(PartyTable partyTable) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('partyTable', partyTable.tabToString());
  }
}
