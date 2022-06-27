import 'dart:convert';

import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:helenundemil/models/challenge.dart';
import 'package:helenundemil/models/guest.dart';
import 'package:helenundemil/models/relationship.dart';
import 'package:helenundemil/usecases/get_own_guest_data_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResolveQRCodeUseCase {
  Future<bool> openScannerForThing() async {
    var content = await resolveQRCode();

    print("I scanned this $content");

    if (content.contains("prefKey")) {
      var prefKey = content.split(':').last.trim();
      await _acceptChallenge(prefKey);
      return true;
    }
    return false;
  }

  Future<bool> openScannerForPersonWithPersonType(
      String prefKey, ChallengeCondition condition) async {
    var content = await resolveQRCode();
    if (content.contains("relationship")) {
      var myJson = json.decode(content);

      Guest otherGuestData = Guest.fromJson(myJson);

      if (await _isAccepted(condition, otherGuestData)) {
        await _acceptChallenge(prefKey);
        return true;
      }
    }
    return false;
  }

  Future<Relationship> showChallengeForRelationship() async {
    GetOwnGuestDataUseCase getOwnGuestDataUseCase = GetOwnGuestDataUseCase();
    var ownGuestData = await getOwnGuestDataUseCase.getOwnGuestData();

    return ownGuestData.relationship;
  }

  Future<bool> _isAccepted(
      ChallengeCondition condition, Guest otherGuestData) async {
    GetOwnGuestDataUseCase getOwnGuestDataUseCase = GetOwnGuestDataUseCase();
    var ownGuestData = await getOwnGuestDataUseCase.getOwnGuestData();
    switch (condition) {
      case ChallengeCondition.anyPerson:
        {
          return true;
        }
      case ChallengeCondition.otherLanguage:
        {
          return ownGuestData.nationality != otherGuestData.nationality;
        }
      case ChallengeCondition.bridalCouple:
        {
          return otherGuestData.bridalCouple;
        }
      case ChallengeCondition.familyEmil:
        {
          return otherGuestData.relationship == Relationship.familyEmil;
        }
      case ChallengeCondition.familyHelen:
        {
          return otherGuestData.relationship == Relationship.familyHelen;
        }
      case ChallengeCondition.friend:
        {
          return otherGuestData.relationship == Relationship.friend;
        }
      case ChallengeCondition.noappuser:
        {
          return otherGuestData.appUser;
        }
      case ChallengeCondition.otherTable:
        {
          return ownGuestData.partyTable != otherGuestData.partyTable;
        }
      case ChallengeCondition.sameTable:
        {
          return ownGuestData.partyTable == otherGuestData.partyTable;
        }
      default:
        {
          return false;
        }
    }
  }

  Future<void> _acceptChallenge(String key) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, true);
    var date = DateTime.now().toString();
    var timeKey = key + "Time";
    await prefs.setString(timeKey, date);
  }

  Future<String> resolveQRCode() async {
    var result = await BarcodeScanner.scan();
    return result.rawContent;
  }
}
