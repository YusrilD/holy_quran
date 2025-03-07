// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_juzz_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetListJuzzModelCollection on Isar {
  IsarCollection<ListJuzzModel> get listJuzzModels => this.collection();
}

const ListJuzzModelSchema = CollectionSchema(
  name: r'ListJuzzModel',
  id: 3434124810080807707,
  properties: {
    r'ayahAmount': PropertySchema(
      id: 0,
      name: r'ayahAmount',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endAyah': PropertySchema(
      id: 2,
      name: r'endAyah',
      type: IsarType.long,
    ),
    r'juzzNumber': PropertySchema(
      id: 3,
      name: r'juzzNumber',
      type: IsarType.long,
    ),
    r'startAyah': PropertySchema(
      id: 4,
      name: r'startAyah',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _listJuzzModelEstimateSize,
  serialize: _listJuzzModelSerialize,
  deserialize: _listJuzzModelDeserialize,
  deserializeProp: _listJuzzModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _listJuzzModelGetId,
  getLinks: _listJuzzModelGetLinks,
  attach: _listJuzzModelAttach,
  version: '3.1.0+1',
);

int _listJuzzModelEstimateSize(
  ListJuzzModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _listJuzzModelSerialize(
  ListJuzzModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ayahAmount);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.endAyah);
  writer.writeLong(offsets[3], object.juzzNumber);
  writer.writeLong(offsets[4], object.startAyah);
  writer.writeDateTime(offsets[5], object.updatedAt);
}

ListJuzzModel _listJuzzModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ListJuzzModel(
    ayahAmount: reader.readLongOrNull(offsets[0]),
    createdAt: reader.readDateTimeOrNull(offsets[1]),
    endAyah: reader.readLongOrNull(offsets[2]),
    id: id,
    juzzNumber: reader.readLongOrNull(offsets[3]),
    startAyah: reader.readLongOrNull(offsets[4]),
    updatedAt: reader.readDateTimeOrNull(offsets[5]),
  );
  return object;
}

P _listJuzzModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _listJuzzModelGetId(ListJuzzModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _listJuzzModelGetLinks(ListJuzzModel object) {
  return [];
}

void _listJuzzModelAttach(
    IsarCollection<dynamic> col, Id id, ListJuzzModel object) {
  object.id = id;
}

extension ListJuzzModelQueryWhereSort
    on QueryBuilder<ListJuzzModel, ListJuzzModel, QWhere> {
  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension ListJuzzModelQueryWhere
    on QueryBuilder<ListJuzzModel, ListJuzzModel, QWhereClause> {
  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause>
      createdAtEqualTo(DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause>
      createdAtNotEqualTo(DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause>
      createdAtLessThan(
    DateTime? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterWhereClause>
      createdAtBetween(
    DateTime? lowerCreatedAt,
    DateTime? upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ListJuzzModelQueryFilter
    on QueryBuilder<ListJuzzModel, ListJuzzModel, QFilterCondition> {
  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      ayahAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ayahAmount',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      ayahAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ayahAmount',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      ayahAmountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ayahAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      endAyahIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endAyah',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      endAyahIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endAyah',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      endAyahEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endAyah',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      juzzNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'juzzNumber',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      juzzNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'juzzNumber',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      juzzNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'juzzNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      juzzNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'juzzNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      juzzNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'juzzNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      juzzNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'juzzNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      startAyahIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startAyah',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      startAyahIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startAyah',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      startAyahEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startAyah',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
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

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ListJuzzModelQueryObject
    on QueryBuilder<ListJuzzModel, ListJuzzModel, QFilterCondition> {}

extension ListJuzzModelQueryLinks
    on QueryBuilder<ListJuzzModel, ListJuzzModel, QFilterCondition> {}

extension ListJuzzModelQuerySortBy
    on QueryBuilder<ListJuzzModel, ListJuzzModel, QSortBy> {
  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> sortByAyahAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahAmount', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy>
      sortByAyahAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahAmount', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> sortByEndAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAyah', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> sortByEndAyahDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAyah', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> sortByJuzzNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juzzNumber', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy>
      sortByJuzzNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juzzNumber', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> sortByStartAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAyah', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy>
      sortByStartAyahDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAyah', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ListJuzzModelQuerySortThenBy
    on QueryBuilder<ListJuzzModel, ListJuzzModel, QSortThenBy> {
  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> thenByAyahAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahAmount', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy>
      thenByAyahAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahAmount', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> thenByEndAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAyah', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> thenByEndAyahDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endAyah', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> thenByJuzzNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juzzNumber', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy>
      thenByJuzzNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juzzNumber', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> thenByStartAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAyah', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy>
      thenByStartAyahDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startAyah', Sort.desc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ListJuzzModelQueryWhereDistinct
    on QueryBuilder<ListJuzzModel, ListJuzzModel, QDistinct> {
  QueryBuilder<ListJuzzModel, ListJuzzModel, QDistinct> distinctByAyahAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ayahAmount');
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QDistinct> distinctByEndAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endAyah');
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QDistinct> distinctByJuzzNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'juzzNumber');
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QDistinct> distinctByStartAyah() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startAyah');
    });
  }

  QueryBuilder<ListJuzzModel, ListJuzzModel, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ListJuzzModelQueryProperty
    on QueryBuilder<ListJuzzModel, ListJuzzModel, QQueryProperty> {
  QueryBuilder<ListJuzzModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ListJuzzModel, int?, QQueryOperations> ayahAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ayahAmount');
    });
  }

  QueryBuilder<ListJuzzModel, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ListJuzzModel, int?, QQueryOperations> endAyahProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endAyah');
    });
  }

  QueryBuilder<ListJuzzModel, int?, QQueryOperations> juzzNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'juzzNumber');
    });
  }

  QueryBuilder<ListJuzzModel, int?, QQueryOperations> startAyahProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startAyah');
    });
  }

  QueryBuilder<ListJuzzModel, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
