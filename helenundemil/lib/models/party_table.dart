import 'package:flutter_translate/flutter_translate.dart';
import 'package:json_annotation/json_annotation.dart';

enum PartyTable {
  @JsonValue('1')
  one,
  @JsonValue('2')
  two,
  @JsonValue('3')
  three,
  @JsonValue('4')
  four,
  @JsonValue('5')
  five,
  @JsonValue('6')
  six,
  @JsonValue('7')
  seven,
}

extension PartyTableExtensions on PartyTable {
  String tabToString() {
    return this.toString().split('.').last;
  }

  String tabToTranslateString() {
    var partyTable = this.toString().split('.').last;
    return translate('partytable.$partyTable');
  }
}

extension mapTable on String {
  PartyTable mapToPartyTable() {
    if (this.toLowerCase() == 'two') {
      return PartyTable.two;
    }
    if (this.toLowerCase() == 'three') {
      return PartyTable.three;
    }
    if (this.toLowerCase() == 'four') {
      return PartyTable.four;
    }
    if (this.toLowerCase() == 'five') {
      return PartyTable.five;
    }
    if (this.toLowerCase() == 'six') {
      return PartyTable.six;
    }
    if (this.toLowerCase() == 'seven') {
      return PartyTable.seven;
    } else {
      return PartyTable.one;
    }
  }
}
