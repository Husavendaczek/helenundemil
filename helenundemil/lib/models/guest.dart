import 'package:helenundemil/models/nationality.dart';
import 'package:helenundemil/models/party_table.dart';
import 'package:helenundemil/models/relationship.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guest.g.dart';

@JsonSerializable()
class Guest {
  final Nationality nationality;
  final Relationship relationship;
  final PartyTable partyTable;
  final bool bridalCouple;
  final bool appUser;

  Guest({
    required this.nationality,
    required this.relationship,
    required this.partyTable,
    required this.bridalCouple,
    required this.appUser,
  });

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
