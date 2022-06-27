import 'package:json_annotation/json_annotation.dart';

enum Nationality {
  @JsonValue('deutsch')
  german,
  @JsonValue('polinsch')
  polish
}

extension mapNationality on String {
  Nationality mapToNationality() {
    if (this.toLowerCase() == 'polnisch') {
      return Nationality.polish;
    } else {
      return Nationality.german;
    }
  }
}
