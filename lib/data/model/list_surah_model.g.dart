// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_surah_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetListSurahModelCollection on Isar {
  IsarCollection<ListSurahModel> get listSurahModels => this.collection();
}

const ListSurahModelSchema = CollectionSchema(
  name: r'ListSurahModel',
  id: 7157714471989989548,
  properties: {
    r'arabName': PropertySchema(
      id: 0,
      name: r'arabName',
      type: IsarType.string,
    ),
    r'ayahAmount': PropertySchema(
      id: 1,
      name: r'ayahAmount',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.string,
    ),
    r'endAyah': PropertySchema(
      id: 3,
      name: r'endAyah',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'startAyah': PropertySchema(
      id: 5,
      name: r'startAyah',
      type: IsarType.long,
    ),
    r'surahNumber': PropertySchema(
      id: 6,
      name: r'surahNumber',
      type: IsarType.long,
    ),
    r'surahType': PropertySchema(
      id: 7,
      name: r'surahType',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.string,
    )
  },
  estimateSize: _listSurahModelEstimateSize,
  serialize: _listSurahModelSerialize,
  deserialize: _listSurahModelDeserialize,
  deserializeProp: _listSurahModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _listSurahModelGetId,
  getLinks: _listSurahModelGetLinks,
  attach: _listSurahModelAttach,
  version: '3.1.0+1',
);

int _listSurahModelEstimateSize(
  ListSurahModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.arabName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.surahType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.updatedAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _listSurahModelSerialize(
  ListSurahModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.arabName);
  writer.writeLong(offsets[1], object.ayahAmount);
  writer.writeString(offsets[2], object.createdAt);
  writer.writeLong(offsets[3], object.endAyah);
  writer.writeString(offsets[4], object.name);
  writer.writeLong(offsets[5], object.startAyah);
  writer.writeLong(offsets[6], object.surahNumber);
  writer.writeString(offsets[7], object.surahType);
  writer.writeString(offsets[8], object.updatedAt);
}

ListSurahModel _listSurahModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ListSurahModel(
    arabName: reader.readStringOrNull(offsets[0]),
    ayahAmount: reader.readLongOrNull(offsets[1]),
    createdAt: reader.readStringOrNull(offsets[2]),
    endAyah: reader.readLongOrNull(offsets[3]),
    id: id,
    name: reader.readStringOrNull(offsets[4]),
    startAyah: reader.readLongOrNull(offsets[5]),
    surahNumber: reader.readLongOrNull(offsets[6]),
    surahType: reader.readStringOrNull(offsets[7]),
    updatedAt: reader.readStringOrNull(offsets[8]),
  );
  return object;
}

P _listSurahModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _listSurahModelGetId(ListSurahModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _listSurahModelGetLinks(ListSurahModel object) {
  return [];
}

void _listSurahModelAttach(
    IsarCollection<dynamic> col, Id id, ListSurahModel object) {
  object.id = id;
}

extension ListSurahModelQueryWhereSort
    on QueryBuilder<ListSurahModel, ListSurahModel, QWhere> {
  QueryBuilder<ListSurahModel, ListSurahModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ListSurahModelQueryWhere
    on QueryBuilder<ListSurahModel, ListSurahModel, QWhereClause> {
  QueryBuilder<ListSurahModel, ListSurahModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ListSurahModelQueryFilter
    on QueryBuilder<ListSurahModel, ListSurahModel, QFilterCondition> {
  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'arabName',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'arabName',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'arabName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'arabName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'arabName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'arabName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'arabName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'arabName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'arabName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'arabName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'arabName',
        value: '',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      arabNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'arabName',
        value: '',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      ayahAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ayahAmount',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      ayahAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ayahAmount',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      ayahAmountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ayahAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      ayahAmountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ayahAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      ayahAmountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ayahAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      ayahAmountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ayahAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      createdAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      endAyahIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endAyah',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      endAyahIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endAyah',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      endAyahEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endAyah',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      endAyahGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endAyah',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      endAyahLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endAyah',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      endAyahBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endAyah',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      startAyahIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startAyah',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      startAyahIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startAyah',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      startAyahEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startAyah',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      startAyahGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startAyah',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      startAyahLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startAyah',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      startAyahBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startAyah',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surahNumber',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surahNumber',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surahNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surahNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surahNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surahNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surahType',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surahType',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surahType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surahType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surahType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surahType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surahType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surahType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surahType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surahType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surahType',
        value: '',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      surahTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surahType',
        value: '',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updatedAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterFilterCondition>
      updatedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updatedAt',
        value: '',
      ));
    });
  }
}

extension ListSurahModelQueryObject
    on QueryBuilder<ListSurahModel, ListSurahModel, QFilterCondition> {}

extension ListSurahModelQueryLinks
    on QueryBuilder<ListSurahModel, ListSurahModel, QFilterCondition> {}

extension ListSurahModelQuerySortBy
    on QueryBuilder<ListSurahModel, ListSurahModel, QSortBy> {
  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> sortByArabName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabName', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      sortByArabNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabName', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      sortByAyahAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahAmount', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      sortByAyahAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahAmount', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> sortByEndAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAyah', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      sortByEndAyahDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAyah', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> sortByStartAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAyah', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      sortByStartAyahDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAyah', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      sortBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      sortBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> sortBySurahType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahType', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      sortBySurahTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahType', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ListSurahModelQuerySortThenBy
    on QueryBuilder<ListSurahModel, ListSurahModel, QSortThenBy> {
  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> thenByArabName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabName', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      thenByArabNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabName', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      thenByAyahAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahAmount', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      thenByAyahAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahAmount', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> thenByEndAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAyah', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      thenByEndAyahDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAyah', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> thenByStartAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAyah', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      thenByStartAyahDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAyah', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      thenBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      thenBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> thenBySurahType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahType', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      thenBySurahTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahType', Sort.desc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ListSurahModelQueryWhereDistinct
    on QueryBuilder<ListSurahModel, ListSurahModel, QDistinct> {
  QueryBuilder<ListSurahModel, ListSurahModel, QDistinct> distinctByArabName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'arabName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QDistinct>
      distinctByAyahAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ayahAmount');
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QDistinct> distinctByCreatedAt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QDistinct> distinctByEndAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endAyah');
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QDistinct>
      distinctByStartAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startAyah');
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QDistinct>
      distinctBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surahNumber');
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QDistinct> distinctBySurahType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surahType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ListSurahModel, ListSurahModel, QDistinct> distinctByUpdatedAt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt', caseSensitive: caseSensitive);
    });
  }
}

extension ListSurahModelQueryProperty
    on QueryBuilder<ListSurahModel, ListSurahModel, QQueryProperty> {
  QueryBuilder<ListSurahModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ListSurahModel, String?, QQueryOperations> arabNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'arabName');
    });
  }

  QueryBuilder<ListSurahModel, int?, QQueryOperations> ayahAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ayahAmount');
    });
  }

  QueryBuilder<ListSurahModel, String?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ListSurahModel, int?, QQueryOperations> endAyahProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endAyah');
    });
  }

  QueryBuilder<ListSurahModel, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ListSurahModel, int?, QQueryOperations> startAyahProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startAyah');
    });
  }

  QueryBuilder<ListSurahModel, int?, QQueryOperations> surahNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surahNumber');
    });
  }

  QueryBuilder<ListSurahModel, String?, QQueryOperations> surahTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surahType');
    });
  }

  QueryBuilder<ListSurahModel, String?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
