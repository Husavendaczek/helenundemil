import 'package:flutter_translate/flutter_translate.dart';
import 'package:json_annotation/json_annotation.dart';

enum Relationship {
  @JsonValue('freunde')
  friend,
  @JsonValue('familyemil')
  familyEmil,
  @JsonValue('familyhelen')
  familyHelen,
}

extension RelationshipExtensions on Relationship {
  bool get isFamily =>
      this == Relationship.familyEmil || this == Relationship.familyHelen;

  String relToString() {
    return this.toString().split('.').last;
  }

  String relToTranslateString() {
    var relationship = this.toString().split('.').last;
    return translate('relationship.$relationship');
  }
}

extension mapRelationship on String {
  Relationship mapToRelationship() {
    if (this.toLowerCase() == 'familyemil') {
      return Relationship.familyEmil;
    } else if (this.toLowerCase() == 'familyhelen') {
      return Relationship.familyHelen;
    } else {
      return Relationship.friend;
    }
  }
}
