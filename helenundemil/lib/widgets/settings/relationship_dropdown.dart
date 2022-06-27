import 'package:flutter/material.dart';
import 'package:helenundemil/models/relationship.dart';
import 'package:helenundemil/widgets/general/my_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RelationshipDropdown extends StatefulWidget {
  final Relationship defaultValue;

  const RelationshipDropdown({Key? key, required this.defaultValue})
      : super(key: key);

  @override
  _RelationshipDropdownState createState() => _RelationshipDropdownState();
}

class _RelationshipDropdownState extends State<RelationshipDropdown> {
  Relationship relationship = Relationship.friend;

  @override
  void initState() {
    _setRelationship(widget.defaultValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Relationship>(
      value: relationship,
      items: _getDropDownItems(),
      onChanged: (Relationship? newValue) {
        _setRelationship(newValue ?? widget.defaultValue);
        setState(() {
          relationship = newValue!;
        });
      },
    );
  }

  List<DropdownMenuItem<Relationship>> _getDropDownItems() {
    return Relationship.values
        .map<DropdownMenuItem<Relationship>>((Relationship value) {
      return DropdownMenuItem<Relationship>(
        value: value,
        child: MyText(text: value.relToTranslateString()),
      );
    }).toList();
  }

  void _setRelationship(Relationship value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('relationship', value.relToString());
  }
}
