import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class TaskData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  BoolColumn get done => boolean().withDefault(Constant(false))();
  TextColumn get weather => text().withLength(min: 1, max: 100)();
  TextColumn get city => text().withLength(min: 1, max: 100)();
}

@DriftDatabase(tables: [TaskData])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_database');
  }
}

