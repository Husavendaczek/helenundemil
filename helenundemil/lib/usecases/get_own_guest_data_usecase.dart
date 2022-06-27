import 'package:helenundemil/models/guest.dart';
import 'package:helenundemil/models/nationality.dart';
import 'package:helenundemil/models/relationship.dart';
import 'package:helenundemil/models/party_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetOwnGuestDataUseCase {
  Future<Guest> getOwnGuestData() async {
    final prefs = await SharedPreferences.getInstance();

    var nationality = prefs.getString('nationality') ?? '';
    var relationship = prefs.getString('relationship') ?? '';
    var partyTable = prefs.getString('partyTable') ?? '';

    return Guest(
        nationality: nationality.mapToNationality(),
        relationship: relationship.mapToRelationship(),
        partyTable: partyTable.mapToPartyTable(),
        bridalCouple: false,
        appUser: true);
  }

  Future<bool> dataExists() async {
    final prefs = await SharedPreferences.getInstance();
    var myData = prefs.getString('relationship');
    return myData != null;
  }
}
