// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TaskDataTable extends TaskData
    with TableInfo<$TaskDataTable, TaskDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
      'done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("done" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _weatherMeta =
      const VerificationMeta('weather');
  @override
  late final GeneratedColumn<String> weather = GeneratedColumn<String>(
      'weather', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, done, weather, city];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_data';
  @override
  VerificationContext validateIntegrity(Insertable<TaskDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('weather')) {
      context.handle(_weatherMeta,
          weather.isAcceptableOrUnknown(data['weather']!, _weatherMeta));
    } else if (isInserting) {
      context.missing(_weatherMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      done: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}done'])!,
      weather: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weather'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
    );
  }

  @override
  $TaskDataTable createAlias(String alias) {
    return $TaskDataTable(attachedDatabase, alias);
  }
}

class TaskDataData extends DataClass implements Insertable<TaskDataData> {
  final int id;
  final String title;
  final bool done;
  final String weather;
  final String city;
  const TaskDataData(
      {required this.id,
      required this.title,
      required this.done,
      required this.weather,
      required this.city});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['done'] = Variable<bool>(done);
    map['weather'] = Variable<String>(weather);
    map['city'] = Variable<String>(city);
    return map;
  }

  TaskDataCompanion toCompanion(bool nullToAbsent) {
    return TaskDataCompanion(
      id: Value(id),
      title: Value(title),
      done: Value(done),
      weather: Value(weather),
      city: Value(city),
    );
  }

  factory TaskDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskDataData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      done: serializer.fromJson<bool>(json['done']),
      weather: serializer.fromJson<String>(json['weather']),
      city: serializer.fromJson<String>(json['city']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'done': serializer.toJson<bool>(done),
      'weather': serializer.toJson<String>(weather),
      'city': serializer.toJson<String>(city),
    };
  }

  TaskDataData copyWith(
          {int? id,
          String? title,
          bool? done,
          String? weather,
          String? city}) =>
      TaskDataData(
        id: id ?? this.id,
        title: title ?? this.title,
        done: done ?? this.done,
        weather: weather ?? this.weather,
        city: city ?? this.city,
      );
  TaskDataData copyWithCompanion(TaskDataCompanion data) {
    return TaskDataData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      done: data.done.present ? data.done.value : this.done,
      weather: data.weather.present ? data.weather.value : this.weather,
      city: data.city.present ? data.city.value : this.city,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskDataData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('done: $done, ')
          ..write('weather: $weather, ')
          ..write('city: $city')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, done, weather, city);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskDataData &&
          other.id == this.id &&
          other.title == this.title &&
          other.done == this.done &&
          other.weather == this.weather &&
          other.city == this.city);
}

class TaskDataCompanion extends UpdateCompanion<TaskDataData> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> done;
  final Value<String> weather;
  final Value<String> city;
  const TaskDataCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.done = const Value.absent(),
    this.weather = const Value.absent(),
    this.city = const Value.absent(),
  });
  TaskDataCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.done = const Value.absent(),
    required String weather,
    required String city,
  })  : title = Value(title),
        weather = Value(weather),
        city = Value(city);
  static Insertable<TaskDataData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? done,
    Expression<String>? weather,
    Expression<String>? city,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (done != null) 'done': done,
      if (weather != null) 'weather': weather,
      if (city != null) 'city': city,
    });
  }

  TaskDataCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<bool>? done,
      Value<String>? weather,
      Value<String>? city}) {
    return TaskDataCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      done: done ?? this.done,
      weather: weather ?? this.weather,
      city: city ?? this.city,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (weather.present) {
      map['weather'] = Variable<String>(weather.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskDataCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('done: $done, ')
          ..write('weather: $weather, ')
          ..write('city: $city')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TaskDataTable taskData = $TaskDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskData];
}

typedef $$TaskDataTableCreateCompanionBuilder = TaskDataCompanion Function({
  Value<int> id,
  required String title,
  Value<bool> done,
  required String weather,
  required String city,
});
typedef $$TaskDataTableUpdateCompanionBuilder = TaskDataCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<bool> done,
  Value<String> weather,
  Value<String> city,
});

class $$TaskDataTableFilterComposer
    extends Composer<_$AppDatabase, $TaskDataTable> {
  $$TaskDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weather => $composableBuilder(
      column: $table.weather, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));
}

class $$TaskDataTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskDataTable> {
  $$TaskDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weather => $composableBuilder(
      column: $table.weather, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));
}

class $$TaskDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskDataTable> {
  $$TaskDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  GeneratedColumn<String> get weather =>
      $composableBuilder(column: $table.weather, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);
}

class $$TaskDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskDataTable,
    TaskDataData,
    $$TaskDataTableFilterComposer,
    $$TaskDataTableOrderingComposer,
    $$TaskDataTableAnnotationComposer,
    $$TaskDataTableCreateCompanionBuilder,
    $$TaskDataTableUpdateCompanionBuilder,
    (TaskDataData, BaseReferences<_$AppDatabase, $TaskDataTable, TaskDataData>),
    TaskDataData,
    PrefetchHooks Function()> {
  $$TaskDataTableTableManager(_$AppDatabase db, $TaskDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<bool> done = const Value.absent(),
            Value<String> weather = const Value.absent(),
            Value<String> city = const Value.absent(),
          }) =>
              TaskDataCompanion(
            id: id,
            title: title,
            done: done,
            weather: weather,
            city: city,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<bool> done = const Value.absent(),
            required String weather,
            required String city,
          }) =>
              TaskDataCompanion.insert(
            id: id,
            title: title,
            done: done,
            weather: weather,
            city: city,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskDataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskDataTable,
    TaskDataData,
    $$TaskDataTableFilterComposer,
    $$TaskDataTableOrderingComposer,
    $$TaskDataTableAnnotationComposer,
    $$TaskDataTableCreateCompanionBuilder,
    $$TaskDataTableUpdateCompanionBuilder,
    (TaskDataData, BaseReferences<_$AppDatabase, $TaskDataTable, TaskDataData>),
    TaskDataData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TaskDataTableTableManager get taskData =>
      $$TaskDataTableTableManager(_db, _db.taskData);
}
