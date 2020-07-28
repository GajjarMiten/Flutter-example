// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_cities.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CityData extends DataClass implements Insertable<CityData> {
  final int id;
  final String city;
  final String state;
  final String district;
  CityData(
      {@required this.id,
      @required this.city,
      @required this.state,
      @required this.district});
  factory CityData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CityData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      city: stringType.mapFromDatabaseResponse(data['${effectivePrefix}city']),
      state:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}state']),
      district: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}district']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || district != null) {
      map['district'] = Variable<String>(district);
    }
    return map;
  }

  CityTableCompanion toCompanion(bool nullToAbsent) {
    return CityTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      district: district == null && nullToAbsent
          ? const Value.absent()
          : Value(district),
    );
  }

  factory CityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CityData(
      id: serializer.fromJson<int>(json['id']),
      city: serializer.fromJson<String>(json['city']),
      state: serializer.fromJson<String>(json['state']),
      district: serializer.fromJson<String>(json['district']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'city': serializer.toJson<String>(city),
      'state': serializer.toJson<String>(state),
      'district': serializer.toJson<String>(district),
    };
  }

  CityData copyWith({int id, String city, String state, String district}) =>
      CityData(
        id: id ?? this.id,
        city: city ?? this.city,
        state: state ?? this.state,
        district: district ?? this.district,
      );
  @override
  String toString() {
    return (StringBuffer('CityData(')
          ..write('id: $id, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('district: $district')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(city.hashCode, $mrjc(state.hashCode, district.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CityData &&
          other.id == this.id &&
          other.city == this.city &&
          other.state == this.state &&
          other.district == this.district);
}

class CityTableCompanion extends UpdateCompanion<CityData> {
  final Value<int> id;
  final Value<String> city;
  final Value<String> state;
  final Value<String> district;
  const CityTableCompanion({
    this.id = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.district = const Value.absent(),
  });
  CityTableCompanion.insert({
    this.id = const Value.absent(),
    @required String city,
    @required String state,
    @required String district,
  })  : city = Value(city),
        state = Value(state),
        district = Value(district);
  static Insertable<CityData> custom({
    Expression<int> id,
    Expression<String> city,
    Expression<String> state,
    Expression<String> district,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (district != null) 'district': district,
    });
  }

  CityTableCompanion copyWith(
      {Value<int> id,
      Value<String> city,
      Value<String> state,
      Value<String> district}) {
    return CityTableCompanion(
      id: id ?? this.id,
      city: city ?? this.city,
      state: state ?? this.state,
      district: district ?? this.district,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (district.present) {
      map['district'] = Variable<String>(district.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CityTableCompanion(')
          ..write('id: $id, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('district: $district')
          ..write(')'))
        .toString();
  }
}

class $CityTableTable extends CityTable
    with TableInfo<$CityTableTable, CityData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CityTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _cityMeta = const VerificationMeta('city');
  GeneratedTextColumn _city;
  @override
  GeneratedTextColumn get city => _city ??= _constructCity();
  GeneratedTextColumn _constructCity() {
    return GeneratedTextColumn('city', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _stateMeta = const VerificationMeta('state');
  GeneratedTextColumn _state;
  @override
  GeneratedTextColumn get state => _state ??= _constructState();
  GeneratedTextColumn _constructState() {
    return GeneratedTextColumn('state', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _districtMeta = const VerificationMeta('district');
  GeneratedTextColumn _district;
  @override
  GeneratedTextColumn get district => _district ??= _constructDistrict();
  GeneratedTextColumn _constructDistrict() {
    return GeneratedTextColumn('district', $tableName, false, minTextLength: 1);
  }

  @override
  List<GeneratedColumn> get $columns => [id, city, state, district];
  @override
  $CityTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'city_table';
  @override
  final String actualTableName = 'city_table';
  @override
  VerificationContext validateIntegrity(Insertable<CityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city'], _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state'], _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('district')) {
      context.handle(_districtMeta,
          district.isAcceptableOrUnknown(data['district'], _districtMeta));
    } else if (isInserting) {
      context.missing(_districtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CityData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CityData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CityTableTable createAlias(String alias) {
    return $CityTableTable(_db, alias);
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CityTableTable _cityTable;
  $CityTableTable get cityTable => _cityTable ??= $CityTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cityTable];
}
