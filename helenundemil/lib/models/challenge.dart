class Challenge {
  final String title;
  final String prefKey;
  final ChallengeType challengeType;
  final ChallengeCondition challengeCondition;
  bool achieved;

  Challenge({
    required this.title,
    required this.prefKey,
    required this.challengeType,
    required this.challengeCondition,
    required this.achieved,
  });
}

enum ChallengeType { thing, person }

enum ChallengeCondition {
  otherLanguage,
  anyPerson,
  thing,
  friend,
  familyEmil,
  familyHelen,
  otherTable,
  sameTable,
  noappuser,
  bridalCouple,
}
