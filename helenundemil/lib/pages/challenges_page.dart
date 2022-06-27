import 'package:flutter/material.dart';
import 'package:helenundemil/models/challenge.dart';
import 'package:helenundemil/models/relationship.dart';
import 'package:helenundemil/usecases/resolve_qr_code_usecase.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/challenges/challenge_checkbox.dart';
import 'package:helenundemil/widgets/general/my_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  @override
  _ChallengesPageState createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  final ResolveQRCodeUseCase _resolveQRCodeUseCase = ResolveQRCodeUseCase();
  List<Challenge> challenges = [];

  List<ChallengeCheckbox> challengesView = [];

  @override
  void initState() {
    _getChallenges();
    _loadCheckboxes();
    super.initState();
  }

  void _loadCheckboxes() async {
    final prefs = await SharedPreferences.getInstance();

    challengesView = challenges.map((challenge) {
      var isChecked = prefs.getBool(challenge.prefKey) ?? false;
      setState(() {
        challenge.achieved = isChecked;
      });

      return ChallengeCheckbox(challenge: challenge);
    }).toList();
  }

  Future<void> _getChallenges() async {
    var guestRelationship =
        await _resolveQRCodeUseCase.showChallengeForRelationship();

    List<Challenge> tmpchallenges = [
      Challenge(
        title: translate('quests.guestbook'),
        prefKey: 'guestbook',
        challengeType: ChallengeType.thing,
        challengeCondition: ChallengeCondition.thing,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.takePic'),
        prefKey: 'takePic',
        challengeType: ChallengeType.thing,
        challengeCondition: ChallengeCondition.thing,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.eatweddingcake'),
        prefKey: 'eatweddingcake',
        challengeType: ChallengeType.thing,
        challengeCondition: ChallengeCondition.thing,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.traubbogenpic'),
        prefKey: 'traubbogenpic',
        challengeType: ChallengeType.thing,
        challengeCondition: ChallengeCondition.thing,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.dance'),
        prefKey: 'dance',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.anyPerson,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.learnWord'),
        prefKey: 'learnWord',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.otherLanguage,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.strangerpic'),
        prefKey: 'strangerpic',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.anyPerson,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.lovepic'),
        prefKey: 'lovepic',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.anyPerson,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.dancepic'),
        prefKey: 'dancepic',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.anyPerson,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.tablegrouppic'),
        prefKey: 'tablegrouppic',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.otherTable,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.tablegag'),
        prefKey: 'tablegag',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.otherTable,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.bestdancer'),
        prefKey: 'bestdancer',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.anyPerson,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.tabledrink'),
        prefKey: 'tabledrink',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.otherTable,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.tiepic'),
        prefKey: 'tiepic',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.anyPerson,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.dresspic'),
        prefKey: 'dresspic',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.anyPerson,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.tabledessert'),
        prefKey: 'tabledessert',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.sameTable,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.tablesong'),
        prefKey: 'tablesong',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.sameTable,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.takePicTogether'),
        prefKey: 'takePicTogether',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.anyPerson,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.scanstrangeqr'),
        prefKey: 'scanstrangeqr',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.noappuser,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.drinkemilhelen'),
        prefKey: 'drinkemilhelen',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.bridalCouple,
        achieved: false,
      ),
      Challenge(
        title: translate('quests.partyemilhelen'),
        prefKey: 'partyemilhelen',
        challengeType: ChallengeType.person,
        challengeCondition: ChallengeCondition.bridalCouple,
        achieved: false,
      ),
    ];

    List<Challenge> relationshipChallenge = [];
    switch (guestRelationship) {
      case Relationship.familyHelen:
        {
          relationshipChallenge = [
            Challenge(
              title: translate('quests.talkpersonb'),
              prefKey: 'talkpersonb',
              challengeType: ChallengeType.person,
              challengeCondition: ChallengeCondition.familyEmil,
              achieved: false,
            ),
            Challenge(
              title: translate('quests.talkpersonc'),
              prefKey: 'talkpersonc',
              challengeType: ChallengeType.person,
              challengeCondition: ChallengeCondition.friend,
              achieved: false,
            ),
          ];
        }
        break;
      case Relationship.familyEmil:
        {
          relationshipChallenge = [
            Challenge(
              title: translate('quests.talkpersona'),
              prefKey: 'talkpersona',
              challengeType: ChallengeType.person,
              challengeCondition: ChallengeCondition.familyHelen,
              achieved: false,
            ),
            Challenge(
              title: translate('quests.talkpersonc'),
              prefKey: 'talkpersonc',
              challengeType: ChallengeType.person,
              challengeCondition: ChallengeCondition.friend,
              achieved: false,
            ),
          ];
        }
        break;
      default:
        {
          relationshipChallenge = [
            Challenge(
              title: translate('quests.talkpersona'),
              prefKey: 'talkpersona',
              challengeType: ChallengeType.person,
              challengeCondition: ChallengeCondition.familyHelen,
              achieved: false,
            ),
            Challenge(
              title: translate('quests.talkpersonb'),
              prefKey: 'talkpersonb',
              challengeType: ChallengeType.person,
              challengeCondition: ChallengeCondition.familyEmil,
              achieved: false,
            ),
          ];
        }
        break;
    }

    tmpchallenges.addAll(relationshipChallenge);

    tmpchallenges.shuffle();
    setState(() {
      challenges = tmpchallenges;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 0, right: 10, bottom: 50),
        child: ListView(
          children: challengesView,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code_scanner),
        backgroundColor: AppColors.Accent,
        onPressed: scan,
      ),
    );
  }

  Future<void> scan() async {
    var success = await _resolveQRCodeUseCase.openScannerForThing();
    _showAlert(context, success);
  }

  void _showAlert(BuildContext context, bool success) {
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
        _loadCheckboxes();
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
