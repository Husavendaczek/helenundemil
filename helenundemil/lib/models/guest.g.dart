// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) {
  return Guest(
    nationality: _$enumDecode(_$NationalityEnumMap, json['nationality']),
    relationship: _$enumDecode(_$RelationshipEnumMap, json['relationship']),
    partyTable: _$enumDecode(_$PartyTableEnumMap, json['partyTable']),
    bridalCouple: json['bridalCouple'] as bool,
    appUser: json['appUser'] as bool,
  );
}

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'nationality': _$NationalityEnumMap[instance.nationality],
      'relationship': _$RelationshipEnumMap[instance.relationship],
      'partyTable': _$PartyTableEnumMap[instance.partyTable],
      'bridalCouple': instance.bridalCouple,
      'appUser': instance.appUser,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$NationalityEnumMap = {
  Nationality.german: 'deutsch',
  Nationality.polish: 'polinsch',
};

const _$RelationshipEnumMap = {
  Relationship.friend: 'freunde',
  Relationship.familyEmil: 'familyemil',
  Relationship.familyHelen: 'familyhelen',
};

const _$PartyTableEnumMap = {
  PartyTable.one: '1',
  PartyTable.two: '2',
  PartyTable.three: '3',
  PartyTable.four: '4',
  PartyTable.five: '5',
  PartyTable.six: '6',
  PartyTable.seven: '7',
};
