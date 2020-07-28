import 'package:moor_flutter/moor_flutter.dart';

part 'fav_cities.g.dart';

@DataClassName('CityData')
class CityTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get city => text().withLength(min: 1)();
  TextColumn get state => text().withLength(min: 1)();
  TextColumn get district => text().withLength(min: 1)();
}

@UseMoor(tables: [CityTable])
class AppDB extends _$AppDB {
  AppDB()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<int> intertCity(CityData entry) => into(cityTable).insert(entry);
  Future<List<CityData>> getAllCity() => select(cityTable).get();
  Stream<List<CityData>> watchAllCity() => select(cityTable).watch();
}
