// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AccountsTable extends Accounts
    with TableInfo<$AccountsTable, AccountRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 60,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<AccountType>($AccountsTable.$convertertype);
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('KZT'),
  );
  static const VerificationMeta _initialBalanceMinorMeta =
      const VerificationMeta('initialBalanceMinor');
  @override
  late final GeneratedColumn<int> initialBalanceMinor = GeneratedColumn<int>(
    'initial_balance_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _iconCodePointMeta = const VerificationMeta(
    'iconCodePoint',
  );
  @override
  late final GeneratedColumn<int> iconCodePoint = GeneratedColumn<int>(
    'icon_code_point',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    currency,
    initialBalanceMinor,
    iconCodePoint,
    colorValue,
    isArchived,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccountRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('initial_balance_minor')) {
      context.handle(
        _initialBalanceMinorMeta,
        initialBalanceMinor.isAcceptableOrUnknown(
          data['initial_balance_minor']!,
          _initialBalanceMinorMeta,
        ),
      );
    }
    if (data.containsKey('icon_code_point')) {
      context.handle(
        _iconCodePointMeta,
        iconCodePoint.isAcceptableOrUnknown(
          data['icon_code_point']!,
          _iconCodePointMeta,
        ),
      );
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: $AccountsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      initialBalanceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}initial_balance_minor'],
      )!,
      iconCodePoint: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_code_point'],
      ),
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      ),
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, int, int> $convertertype =
      const EnumIndexConverter<AccountType>(AccountType.values);
}

class AccountRow extends DataClass implements Insertable<AccountRow> {
  final int id;
  final String name;
  final AccountType type;
  final String currency;

  /// Стартовый остаток в тиынах. Текущий баланс = стартовый + сумма операций.
  final int initialBalanceMinor;
  final int? iconCodePoint;
  final int? colorValue;
  final bool isArchived;
  final int sortOrder;
  const AccountRow({
    required this.id,
    required this.name,
    required this.type,
    required this.currency,
    required this.initialBalanceMinor,
    this.iconCodePoint,
    this.colorValue,
    required this.isArchived,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<int>($AccountsTable.$convertertype.toSql(type));
    }
    map['currency'] = Variable<String>(currency);
    map['initial_balance_minor'] = Variable<int>(initialBalanceMinor);
    if (!nullToAbsent || iconCodePoint != null) {
      map['icon_code_point'] = Variable<int>(iconCodePoint);
    }
    if (!nullToAbsent || colorValue != null) {
      map['color_value'] = Variable<int>(colorValue);
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      currency: Value(currency),
      initialBalanceMinor: Value(initialBalanceMinor),
      iconCodePoint: iconCodePoint == null && nullToAbsent
          ? const Value.absent()
          : Value(iconCodePoint),
      colorValue: colorValue == null && nullToAbsent
          ? const Value.absent()
          : Value(colorValue),
      isArchived: Value(isArchived),
      sortOrder: Value(sortOrder),
    );
  }

  factory AccountRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: $AccountsTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      currency: serializer.fromJson<String>(json['currency']),
      initialBalanceMinor: serializer.fromJson<int>(
        json['initialBalanceMinor'],
      ),
      iconCodePoint: serializer.fromJson<int?>(json['iconCodePoint']),
      colorValue: serializer.fromJson<int?>(json['colorValue']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<int>(
        $AccountsTable.$convertertype.toJson(type),
      ),
      'currency': serializer.toJson<String>(currency),
      'initialBalanceMinor': serializer.toJson<int>(initialBalanceMinor),
      'iconCodePoint': serializer.toJson<int?>(iconCodePoint),
      'colorValue': serializer.toJson<int?>(colorValue),
      'isArchived': serializer.toJson<bool>(isArchived),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  AccountRow copyWith({
    int? id,
    String? name,
    AccountType? type,
    String? currency,
    int? initialBalanceMinor,
    Value<int?> iconCodePoint = const Value.absent(),
    Value<int?> colorValue = const Value.absent(),
    bool? isArchived,
    int? sortOrder,
  }) => AccountRow(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    currency: currency ?? this.currency,
    initialBalanceMinor: initialBalanceMinor ?? this.initialBalanceMinor,
    iconCodePoint: iconCodePoint.present
        ? iconCodePoint.value
        : this.iconCodePoint,
    colorValue: colorValue.present ? colorValue.value : this.colorValue,
    isArchived: isArchived ?? this.isArchived,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  AccountRow copyWithCompanion(AccountsCompanion data) {
    return AccountRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      currency: data.currency.present ? data.currency.value : this.currency,
      initialBalanceMinor: data.initialBalanceMinor.present
          ? data.initialBalanceMinor.value
          : this.initialBalanceMinor,
      iconCodePoint: data.iconCodePoint.present
          ? data.iconCodePoint.value
          : this.iconCodePoint,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('initialBalanceMinor: $initialBalanceMinor, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('colorValue: $colorValue, ')
          ..write('isArchived: $isArchived, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    currency,
    initialBalanceMinor,
    iconCodePoint,
    colorValue,
    isArchived,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.currency == this.currency &&
          other.initialBalanceMinor == this.initialBalanceMinor &&
          other.iconCodePoint == this.iconCodePoint &&
          other.colorValue == this.colorValue &&
          other.isArchived == this.isArchived &&
          other.sortOrder == this.sortOrder);
}

class AccountsCompanion extends UpdateCompanion<AccountRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<AccountType> type;
  final Value<String> currency;
  final Value<int> initialBalanceMinor;
  final Value<int?> iconCodePoint;
  final Value<int?> colorValue;
  final Value<bool> isArchived;
  final Value<int> sortOrder;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.currency = const Value.absent(),
    this.initialBalanceMinor = const Value.absent(),
    this.iconCodePoint = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required AccountType type,
    this.currency = const Value.absent(),
    this.initialBalanceMinor = const Value.absent(),
    this.iconCodePoint = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.sortOrder = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<AccountRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? type,
    Expression<String>? currency,
    Expression<int>? initialBalanceMinor,
    Expression<int>? iconCodePoint,
    Expression<int>? colorValue,
    Expression<bool>? isArchived,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (currency != null) 'currency': currency,
      if (initialBalanceMinor != null)
        'initial_balance_minor': initialBalanceMinor,
      if (iconCodePoint != null) 'icon_code_point': iconCodePoint,
      if (colorValue != null) 'color_value': colorValue,
      if (isArchived != null) 'is_archived': isArchived,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  AccountsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<AccountType>? type,
    Value<String>? currency,
    Value<int>? initialBalanceMinor,
    Value<int?>? iconCodePoint,
    Value<int?>? colorValue,
    Value<bool>? isArchived,
    Value<int>? sortOrder,
  }) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      initialBalanceMinor: initialBalanceMinor ?? this.initialBalanceMinor,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      colorValue: colorValue ?? this.colorValue,
      isArchived: isArchived ?? this.isArchived,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $AccountsTable.$convertertype.toSql(type.value),
      );
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (initialBalanceMinor.present) {
      map['initial_balance_minor'] = Variable<int>(initialBalanceMinor.value);
    }
    if (iconCodePoint.present) {
      map['icon_code_point'] = Variable<int>(iconCodePoint.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('initialBalanceMinor: $initialBalanceMinor, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('colorValue: $colorValue, ')
          ..write('isArchived: $isArchived, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameKkMeta = const VerificationMeta('nameKk');
  @override
  late final GeneratedColumn<String> nameKk = GeneratedColumn<String>(
    'name_kk',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameRuMeta = const VerificationMeta('nameRu');
  @override
  late final GeneratedColumn<String> nameRu = GeneratedColumn<String>(
    'name_ru',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EntryType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<EntryType>($CategoriesTable.$convertertype);
  static const VerificationMeta _iconCodePointMeta = const VerificationMeta(
    'iconCodePoint',
  );
  @override
  late final GeneratedColumn<int> iconCodePoint = GeneratedColumn<int>(
    'icon_code_point',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nameKk,
    nameRu,
    type,
    iconCodePoint,
    colorValue,
    isArchived,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_kk')) {
      context.handle(
        _nameKkMeta,
        nameKk.isAcceptableOrUnknown(data['name_kk']!, _nameKkMeta),
      );
    } else if (isInserting) {
      context.missing(_nameKkMeta);
    }
    if (data.containsKey('name_ru')) {
      context.handle(
        _nameRuMeta,
        nameRu.isAcceptableOrUnknown(data['name_ru']!, _nameRuMeta),
      );
    } else if (isInserting) {
      context.missing(_nameRuMeta);
    }
    if (data.containsKey('icon_code_point')) {
      context.handle(
        _iconCodePointMeta,
        iconCodePoint.isAcceptableOrUnknown(
          data['icon_code_point']!,
          _iconCodePointMeta,
        ),
      );
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nameKk: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_kk'],
      )!,
      nameRu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ru'],
      )!,
      type: $CategoriesTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      iconCodePoint: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_code_point'],
      ),
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      ),
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EntryType, int, int> $convertertype =
      const EnumIndexConverter<EntryType>(EntryType.values);
}

class CategoryRow extends DataClass implements Insertable<CategoryRow> {
  final int id;
  final String nameKk;
  final String nameRu;
  final EntryType type;
  final int? iconCodePoint;
  final int? colorValue;
  final bool isArchived;
  final int sortOrder;
  const CategoryRow({
    required this.id,
    required this.nameKk,
    required this.nameRu,
    required this.type,
    this.iconCodePoint,
    this.colorValue,
    required this.isArchived,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_kk'] = Variable<String>(nameKk);
    map['name_ru'] = Variable<String>(nameRu);
    {
      map['type'] = Variable<int>($CategoriesTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || iconCodePoint != null) {
      map['icon_code_point'] = Variable<int>(iconCodePoint);
    }
    if (!nullToAbsent || colorValue != null) {
      map['color_value'] = Variable<int>(colorValue);
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      nameKk: Value(nameKk),
      nameRu: Value(nameRu),
      type: Value(type),
      iconCodePoint: iconCodePoint == null && nullToAbsent
          ? const Value.absent()
          : Value(iconCodePoint),
      colorValue: colorValue == null && nullToAbsent
          ? const Value.absent()
          : Value(colorValue),
      isArchived: Value(isArchived),
      sortOrder: Value(sortOrder),
    );
  }

  factory CategoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryRow(
      id: serializer.fromJson<int>(json['id']),
      nameKk: serializer.fromJson<String>(json['nameKk']),
      nameRu: serializer.fromJson<String>(json['nameRu']),
      type: $CategoriesTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      iconCodePoint: serializer.fromJson<int?>(json['iconCodePoint']),
      colorValue: serializer.fromJson<int?>(json['colorValue']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameKk': serializer.toJson<String>(nameKk),
      'nameRu': serializer.toJson<String>(nameRu),
      'type': serializer.toJson<int>(
        $CategoriesTable.$convertertype.toJson(type),
      ),
      'iconCodePoint': serializer.toJson<int?>(iconCodePoint),
      'colorValue': serializer.toJson<int?>(colorValue),
      'isArchived': serializer.toJson<bool>(isArchived),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  CategoryRow copyWith({
    int? id,
    String? nameKk,
    String? nameRu,
    EntryType? type,
    Value<int?> iconCodePoint = const Value.absent(),
    Value<int?> colorValue = const Value.absent(),
    bool? isArchived,
    int? sortOrder,
  }) => CategoryRow(
    id: id ?? this.id,
    nameKk: nameKk ?? this.nameKk,
    nameRu: nameRu ?? this.nameRu,
    type: type ?? this.type,
    iconCodePoint: iconCodePoint.present
        ? iconCodePoint.value
        : this.iconCodePoint,
    colorValue: colorValue.present ? colorValue.value : this.colorValue,
    isArchived: isArchived ?? this.isArchived,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  CategoryRow copyWithCompanion(CategoriesCompanion data) {
    return CategoryRow(
      id: data.id.present ? data.id.value : this.id,
      nameKk: data.nameKk.present ? data.nameKk.value : this.nameKk,
      nameRu: data.nameRu.present ? data.nameRu.value : this.nameRu,
      type: data.type.present ? data.type.value : this.type,
      iconCodePoint: data.iconCodePoint.present
          ? data.iconCodePoint.value
          : this.iconCodePoint,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRow(')
          ..write('id: $id, ')
          ..write('nameKk: $nameKk, ')
          ..write('nameRu: $nameRu, ')
          ..write('type: $type, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('colorValue: $colorValue, ')
          ..write('isArchived: $isArchived, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nameKk,
    nameRu,
    type,
    iconCodePoint,
    colorValue,
    isArchived,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryRow &&
          other.id == this.id &&
          other.nameKk == this.nameKk &&
          other.nameRu == this.nameRu &&
          other.type == this.type &&
          other.iconCodePoint == this.iconCodePoint &&
          other.colorValue == this.colorValue &&
          other.isArchived == this.isArchived &&
          other.sortOrder == this.sortOrder);
}

class CategoriesCompanion extends UpdateCompanion<CategoryRow> {
  final Value<int> id;
  final Value<String> nameKk;
  final Value<String> nameRu;
  final Value<EntryType> type;
  final Value<int?> iconCodePoint;
  final Value<int?> colorValue;
  final Value<bool> isArchived;
  final Value<int> sortOrder;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.nameKk = const Value.absent(),
    this.nameRu = const Value.absent(),
    this.type = const Value.absent(),
    this.iconCodePoint = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String nameKk,
    required String nameRu,
    required EntryType type,
    this.iconCodePoint = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.sortOrder = const Value.absent(),
  }) : nameKk = Value(nameKk),
       nameRu = Value(nameRu),
       type = Value(type);
  static Insertable<CategoryRow> custom({
    Expression<int>? id,
    Expression<String>? nameKk,
    Expression<String>? nameRu,
    Expression<int>? type,
    Expression<int>? iconCodePoint,
    Expression<int>? colorValue,
    Expression<bool>? isArchived,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameKk != null) 'name_kk': nameKk,
      if (nameRu != null) 'name_ru': nameRu,
      if (type != null) 'type': type,
      if (iconCodePoint != null) 'icon_code_point': iconCodePoint,
      if (colorValue != null) 'color_value': colorValue,
      if (isArchived != null) 'is_archived': isArchived,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? nameKk,
    Value<String>? nameRu,
    Value<EntryType>? type,
    Value<int?>? iconCodePoint,
    Value<int?>? colorValue,
    Value<bool>? isArchived,
    Value<int>? sortOrder,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      nameKk: nameKk ?? this.nameKk,
      nameRu: nameRu ?? this.nameRu,
      type: type ?? this.type,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      colorValue: colorValue ?? this.colorValue,
      isArchived: isArchived ?? this.isArchived,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameKk.present) {
      map['name_kk'] = Variable<String>(nameKk.value);
    }
    if (nameRu.present) {
      map['name_ru'] = Variable<String>(nameRu.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $CategoriesTable.$convertertype.toSql(type.value),
      );
    }
    if (iconCodePoint.present) {
      map['icon_code_point'] = Variable<int>(iconCodePoint.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('nameKk: $nameKk, ')
          ..write('nameRu: $nameRu, ')
          ..write('type: $type, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('colorValue: $colorValue, ')
          ..write('isArchived: $isArchived, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES accounts (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EntryType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<EntryType>($TransactionsTable.$convertertype);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _merchantMeta = const VerificationMeta(
    'merchant',
  );
  @override
  late final GeneratedColumn<String> merchant = GeneratedColumn<String>(
    'merchant',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TransactionSource, int> source =
      GeneratedColumn<int>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: Constant(TransactionSource.manual.index),
      ).withConverter<TransactionSource>($TransactionsTable.$convertersource);
  @override
  late final GeneratedColumnWithTypeConverter<TransactionStatus, int> status =
      GeneratedColumn<int>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: Constant(TransactionStatus.confirmed.index),
      ).withConverter<TransactionStatus>($TransactionsTable.$converterstatus);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _importHashMeta = const VerificationMeta(
    'importHash',
  );
  @override
  late final GeneratedColumn<String> importHash = GeneratedColumn<String>(
    'import_hash',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    categoryId,
    amountMinor,
    type,
    date,
    note,
    merchant,
    source,
    status,
    createdAt,
    importHash,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('merchant')) {
      context.handle(
        _merchantMeta,
        merchant.isAcceptableOrUnknown(data['merchant']!, _merchantMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('import_hash')) {
      context.handle(
        _importHashMeta,
        importHash.isAcceptableOrUnknown(data['import_hash']!, _importHashMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      ),
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      type: $TransactionsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      merchant: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}merchant'],
      ),
      source: $TransactionsTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}source'],
        )!,
      ),
      status: $TransactionsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}status'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      importHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}import_hash'],
      ),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EntryType, int, int> $convertertype =
      const EnumIndexConverter<EntryType>(EntryType.values);
  static JsonTypeConverter2<TransactionSource, int, int> $convertersource =
      const EnumIndexConverter<TransactionSource>(TransactionSource.values);
  static JsonTypeConverter2<TransactionStatus, int, int> $converterstatus =
      const EnumIndexConverter<TransactionStatus>(TransactionStatus.values);
}

class TransactionRow extends DataClass implements Insertable<TransactionRow> {
  final int id;
  final int accountId;
  final int? categoryId;

  /// Сумма в тиынах, всегда положительная. Знак определяется полем [type].
  final int amountMinor;
  final EntryType type;
  final DateTime date;
  final String? note;
  final String? merchant;
  final TransactionSource source;
  final TransactionStatus status;
  final DateTime createdAt;

  /// Сигнатура операции из импорта выписки — для защиты от дублей.
  final String? importHash;
  const TransactionRow({
    required this.id,
    required this.accountId,
    this.categoryId,
    required this.amountMinor,
    required this.type,
    required this.date,
    this.note,
    this.merchant,
    required this.source,
    required this.status,
    required this.createdAt,
    this.importHash,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_id'] = Variable<int>(accountId);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    map['amount_minor'] = Variable<int>(amountMinor);
    {
      map['type'] = Variable<int>(
        $TransactionsTable.$convertertype.toSql(type),
      );
    }
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || merchant != null) {
      map['merchant'] = Variable<String>(merchant);
    }
    {
      map['source'] = Variable<int>(
        $TransactionsTable.$convertersource.toSql(source),
      );
    }
    {
      map['status'] = Variable<int>(
        $TransactionsTable.$converterstatus.toSql(status),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || importHash != null) {
      map['import_hash'] = Variable<String>(importHash);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      accountId: Value(accountId),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      amountMinor: Value(amountMinor),
      type: Value(type),
      date: Value(date),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      merchant: merchant == null && nullToAbsent
          ? const Value.absent()
          : Value(merchant),
      source: Value(source),
      status: Value(status),
      createdAt: Value(createdAt),
      importHash: importHash == null && nullToAbsent
          ? const Value.absent()
          : Value(importHash),
    );
  }

  factory TransactionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRow(
      id: serializer.fromJson<int>(json['id']),
      accountId: serializer.fromJson<int>(json['accountId']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      type: $TransactionsTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      date: serializer.fromJson<DateTime>(json['date']),
      note: serializer.fromJson<String?>(json['note']),
      merchant: serializer.fromJson<String?>(json['merchant']),
      source: $TransactionsTable.$convertersource.fromJson(
        serializer.fromJson<int>(json['source']),
      ),
      status: $TransactionsTable.$converterstatus.fromJson(
        serializer.fromJson<int>(json['status']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      importHash: serializer.fromJson<String?>(json['importHash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountId': serializer.toJson<int>(accountId),
      'categoryId': serializer.toJson<int?>(categoryId),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'type': serializer.toJson<int>(
        $TransactionsTable.$convertertype.toJson(type),
      ),
      'date': serializer.toJson<DateTime>(date),
      'note': serializer.toJson<String?>(note),
      'merchant': serializer.toJson<String?>(merchant),
      'source': serializer.toJson<int>(
        $TransactionsTable.$convertersource.toJson(source),
      ),
      'status': serializer.toJson<int>(
        $TransactionsTable.$converterstatus.toJson(status),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'importHash': serializer.toJson<String?>(importHash),
    };
  }

  TransactionRow copyWith({
    int? id,
    int? accountId,
    Value<int?> categoryId = const Value.absent(),
    int? amountMinor,
    EntryType? type,
    DateTime? date,
    Value<String?> note = const Value.absent(),
    Value<String?> merchant = const Value.absent(),
    TransactionSource? source,
    TransactionStatus? status,
    DateTime? createdAt,
    Value<String?> importHash = const Value.absent(),
  }) => TransactionRow(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    amountMinor: amountMinor ?? this.amountMinor,
    type: type ?? this.type,
    date: date ?? this.date,
    note: note.present ? note.value : this.note,
    merchant: merchant.present ? merchant.value : this.merchant,
    source: source ?? this.source,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    importHash: importHash.present ? importHash.value : this.importHash,
  );
  TransactionRow copyWithCompanion(TransactionsCompanion data) {
    return TransactionRow(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      type: data.type.present ? data.type.value : this.type,
      date: data.date.present ? data.date.value : this.date,
      note: data.note.present ? data.note.value : this.note,
      merchant: data.merchant.present ? data.merchant.value : this.merchant,
      source: data.source.present ? data.source.value : this.source,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      importHash: data.importHash.present
          ? data.importHash.value
          : this.importHash,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRow(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('merchant: $merchant, ')
          ..write('source: $source, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('importHash: $importHash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accountId,
    categoryId,
    amountMinor,
    type,
    date,
    note,
    merchant,
    source,
    status,
    createdAt,
    importHash,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRow &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.categoryId == this.categoryId &&
          other.amountMinor == this.amountMinor &&
          other.type == this.type &&
          other.date == this.date &&
          other.note == this.note &&
          other.merchant == this.merchant &&
          other.source == this.source &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.importHash == this.importHash);
}

class TransactionsCompanion extends UpdateCompanion<TransactionRow> {
  final Value<int> id;
  final Value<int> accountId;
  final Value<int?> categoryId;
  final Value<int> amountMinor;
  final Value<EntryType> type;
  final Value<DateTime> date;
  final Value<String?> note;
  final Value<String?> merchant;
  final Value<TransactionSource> source;
  final Value<TransactionStatus> status;
  final Value<DateTime> createdAt;
  final Value<String?> importHash;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.type = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
    this.merchant = const Value.absent(),
    this.source = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.importHash = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int accountId,
    this.categoryId = const Value.absent(),
    required int amountMinor,
    required EntryType type,
    required DateTime date,
    this.note = const Value.absent(),
    this.merchant = const Value.absent(),
    this.source = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.importHash = const Value.absent(),
  }) : accountId = Value(accountId),
       amountMinor = Value(amountMinor),
       type = Value(type),
       date = Value(date);
  static Insertable<TransactionRow> custom({
    Expression<int>? id,
    Expression<int>? accountId,
    Expression<int>? categoryId,
    Expression<int>? amountMinor,
    Expression<int>? type,
    Expression<DateTime>? date,
    Expression<String>? note,
    Expression<String>? merchant,
    Expression<int>? source,
    Expression<int>? status,
    Expression<DateTime>? createdAt,
    Expression<String>? importHash,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (categoryId != null) 'category_id': categoryId,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (type != null) 'type': type,
      if (date != null) 'date': date,
      if (note != null) 'note': note,
      if (merchant != null) 'merchant': merchant,
      if (source != null) 'source': source,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (importHash != null) 'import_hash': importHash,
    });
  }

  TransactionsCompanion copyWith({
    Value<int>? id,
    Value<int>? accountId,
    Value<int?>? categoryId,
    Value<int>? amountMinor,
    Value<EntryType>? type,
    Value<DateTime>? date,
    Value<String?>? note,
    Value<String?>? merchant,
    Value<TransactionSource>? source,
    Value<TransactionStatus>? status,
    Value<DateTime>? createdAt,
    Value<String?>? importHash,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      amountMinor: amountMinor ?? this.amountMinor,
      type: type ?? this.type,
      date: date ?? this.date,
      note: note ?? this.note,
      merchant: merchant ?? this.merchant,
      source: source ?? this.source,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      importHash: importHash ?? this.importHash,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $TransactionsTable.$convertertype.toSql(type.value),
      );
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (merchant.present) {
      map['merchant'] = Variable<String>(merchant.value);
    }
    if (source.present) {
      map['source'] = Variable<int>(
        $TransactionsTable.$convertersource.toSql(source.value),
      );
    }
    if (status.present) {
      map['status'] = Variable<int>(
        $TransactionsTable.$converterstatus.toSql(status.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (importHash.present) {
      map['import_hash'] = Variable<String>(importHash.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('merchant: $merchant, ')
          ..write('source: $source, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('importHash: $importHash')
          ..write(')'))
        .toString();
  }
}

class $BudgetsTable extends Budgets with TableInfo<$BudgetsTable, BudgetRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<BudgetPeriod, int> period =
      GeneratedColumn<int>(
        'period',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: Constant(BudgetPeriod.month.index),
      ).withConverter<BudgetPeriod>($BudgetsTable.$converterperiod);
  static const VerificationMeta _limitMinorMeta = const VerificationMeta(
    'limitMinor',
  );
  @override
  late final GeneratedColumn<int> limitMinor = GeneratedColumn<int>(
    'limit_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categoryId,
    period,
    limitMinor,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budgets';
  @override
  VerificationContext validateIntegrity(
    Insertable<BudgetRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('limit_minor')) {
      context.handle(
        _limitMinorMeta,
        limitMinor.isAcceptableOrUnknown(data['limit_minor']!, _limitMinorMeta),
      );
    } else if (isInserting) {
      context.missing(_limitMinorMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      period: $BudgetsTable.$converterperiod.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}period'],
        )!,
      ),
      limitMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}limit_minor'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BudgetsTable createAlias(String alias) {
    return $BudgetsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<BudgetPeriod, int, int> $converterperiod =
      const EnumIndexConverter<BudgetPeriod>(BudgetPeriod.values);
}

class BudgetRow extends DataClass implements Insertable<BudgetRow> {
  final int id;
  final int categoryId;
  final BudgetPeriod period;

  /// Лимит в тиынах.
  final int limitMinor;
  final DateTime createdAt;
  const BudgetRow({
    required this.id,
    required this.categoryId,
    required this.period,
    required this.limitMinor,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    {
      map['period'] = Variable<int>(
        $BudgetsTable.$converterperiod.toSql(period),
      );
    }
    map['limit_minor'] = Variable<int>(limitMinor);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BudgetsCompanion toCompanion(bool nullToAbsent) {
    return BudgetsCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      period: Value(period),
      limitMinor: Value(limitMinor),
      createdAt: Value(createdAt),
    );
  }

  factory BudgetRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetRow(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      period: $BudgetsTable.$converterperiod.fromJson(
        serializer.fromJson<int>(json['period']),
      ),
      limitMinor: serializer.fromJson<int>(json['limitMinor']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'period': serializer.toJson<int>(
        $BudgetsTable.$converterperiod.toJson(period),
      ),
      'limitMinor': serializer.toJson<int>(limitMinor),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BudgetRow copyWith({
    int? id,
    int? categoryId,
    BudgetPeriod? period,
    int? limitMinor,
    DateTime? createdAt,
  }) => BudgetRow(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    period: period ?? this.period,
    limitMinor: limitMinor ?? this.limitMinor,
    createdAt: createdAt ?? this.createdAt,
  );
  BudgetRow copyWithCompanion(BudgetsCompanion data) {
    return BudgetRow(
      id: data.id.present ? data.id.value : this.id,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      period: data.period.present ? data.period.value : this.period,
      limitMinor: data.limitMinor.present
          ? data.limitMinor.value
          : this.limitMinor,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BudgetRow(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('period: $period, ')
          ..write('limitMinor: $limitMinor, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, categoryId, period, limitMinor, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetRow &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.period == this.period &&
          other.limitMinor == this.limitMinor &&
          other.createdAt == this.createdAt);
}

class BudgetsCompanion extends UpdateCompanion<BudgetRow> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<BudgetPeriod> period;
  final Value<int> limitMinor;
  final Value<DateTime> createdAt;
  const BudgetsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.period = const Value.absent(),
    this.limitMinor = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BudgetsCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    this.period = const Value.absent(),
    required int limitMinor,
    this.createdAt = const Value.absent(),
  }) : categoryId = Value(categoryId),
       limitMinor = Value(limitMinor);
  static Insertable<BudgetRow> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<int>? period,
    Expression<int>? limitMinor,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (period != null) 'period': period,
      if (limitMinor != null) 'limit_minor': limitMinor,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BudgetsCompanion copyWith({
    Value<int>? id,
    Value<int>? categoryId,
    Value<BudgetPeriod>? period,
    Value<int>? limitMinor,
    Value<DateTime>? createdAt,
  }) {
    return BudgetsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      period: period ?? this.period,
      limitMinor: limitMinor ?? this.limitMinor,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (period.present) {
      map['period'] = Variable<int>(
        $BudgetsTable.$converterperiod.toSql(period.value),
      );
    }
    if (limitMinor.present) {
      map['limit_minor'] = Variable<int>(limitMinor.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('period: $period, ')
          ..write('limitMinor: $limitMinor, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $BudgetsTable budgets = $BudgetsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    accounts,
    categories,
    transactions,
    budgets,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'accounts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('transactions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'categories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('transactions', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'categories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('budgets', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$AccountsTableCreateCompanionBuilder =
    AccountsCompanion Function({
      Value<int> id,
      required String name,
      required AccountType type,
      Value<String> currency,
      Value<int> initialBalanceMinor,
      Value<int?> iconCodePoint,
      Value<int?> colorValue,
      Value<bool> isArchived,
      Value<int> sortOrder,
    });
typedef $$AccountsTableUpdateCompanionBuilder =
    AccountsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<AccountType> type,
      Value<String> currency,
      Value<int> initialBalanceMinor,
      Value<int?> iconCodePoint,
      Value<int?> colorValue,
      Value<bool> isArchived,
      Value<int> sortOrder,
    });

final class $$AccountsTableReferences
    extends BaseReferences<_$AppDatabase, $AccountsTable, AccountRow> {
  $$AccountsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsTable, List<TransactionRow>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(db.accounts.id, db.transactions.accountId),
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AccountType, AccountType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get initialBalanceMinor => $composableBuilder(
    column: $table.initialBalanceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get iconCodePoint => $composableBuilder(
    column: $table.iconCodePoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get initialBalanceMinor => $composableBuilder(
    column: $table.initialBalanceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get iconCodePoint => $composableBuilder(
    column: $table.iconCodePoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AccountType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<int> get initialBalanceMinor => $composableBuilder(
    column: $table.initialBalanceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get iconCodePoint => $composableBuilder(
    column: $table.iconCodePoint,
    builder: (column) => column,
  );

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.accountId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountsTable,
          AccountRow,
          $$AccountsTableFilterComposer,
          $$AccountsTableOrderingComposer,
          $$AccountsTableAnnotationComposer,
          $$AccountsTableCreateCompanionBuilder,
          $$AccountsTableUpdateCompanionBuilder,
          (AccountRow, $$AccountsTableReferences),
          AccountRow,
          PrefetchHooks Function({bool transactionsRefs})
        > {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<AccountType> type = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<int> initialBalanceMinor = const Value.absent(),
                Value<int?> iconCodePoint = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => AccountsCompanion(
                id: id,
                name: name,
                type: type,
                currency: currency,
                initialBalanceMinor: initialBalanceMinor,
                iconCodePoint: iconCodePoint,
                colorValue: colorValue,
                isArchived: isArchived,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required AccountType type,
                Value<String> currency = const Value.absent(),
                Value<int> initialBalanceMinor = const Value.absent(),
                Value<int?> iconCodePoint = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => AccountsCompanion.insert(
                id: id,
                name: name,
                type: type,
                currency: currency,
                initialBalanceMinor: initialBalanceMinor,
                iconCodePoint: iconCodePoint,
                colorValue: colorValue,
                isArchived: isArchived,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<
                      AccountRow,
                      $AccountsTable,
                      TransactionRow
                    >(
                      currentTable: table,
                      referencedTable: $$AccountsTableReferences
                          ._transactionsRefsTable(db),
                      managerFromTypedResult: (p0) => $$AccountsTableReferences(
                        db,
                        table,
                        p0,
                      ).transactionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.accountId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountsTable,
      AccountRow,
      $$AccountsTableFilterComposer,
      $$AccountsTableOrderingComposer,
      $$AccountsTableAnnotationComposer,
      $$AccountsTableCreateCompanionBuilder,
      $$AccountsTableUpdateCompanionBuilder,
      (AccountRow, $$AccountsTableReferences),
      AccountRow,
      PrefetchHooks Function({bool transactionsRefs})
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      required String nameKk,
      required String nameRu,
      required EntryType type,
      Value<int?> iconCodePoint,
      Value<int?> colorValue,
      Value<bool> isArchived,
      Value<int> sortOrder,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      Value<String> nameKk,
      Value<String> nameRu,
      Value<EntryType> type,
      Value<int?> iconCodePoint,
      Value<int?> colorValue,
      Value<bool> isArchived,
      Value<int> sortOrder,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, CategoryRow> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsTable, List<TransactionRow>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(
      db.categories.id,
      db.transactions.categoryId,
    ),
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BudgetsTable, List<BudgetRow>> _budgetsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.budgets,
    aliasName: $_aliasNameGenerator(db.categories.id, db.budgets.categoryId),
  );

  $$BudgetsTableProcessedTableManager get budgetsRefs {
    final manager = $$BudgetsTableTableManager(
      $_db,
      $_db.budgets,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_budgetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameKk => $composableBuilder(
    column: $table.nameKk,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameRu => $composableBuilder(
    column: $table.nameRu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EntryType, EntryType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get iconCodePoint => $composableBuilder(
    column: $table.iconCodePoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> budgetsRefs(
    Expression<bool> Function($$BudgetsTableFilterComposer f) f,
  ) {
    final $$BudgetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgets,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BudgetsTableFilterComposer(
            $db: $db,
            $table: $db.budgets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameKk => $composableBuilder(
    column: $table.nameKk,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameRu => $composableBuilder(
    column: $table.nameRu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get iconCodePoint => $composableBuilder(
    column: $table.iconCodePoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameKk =>
      $composableBuilder(column: $table.nameKk, builder: (column) => column);

  GeneratedColumn<String> get nameRu =>
      $composableBuilder(column: $table.nameRu, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EntryType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get iconCodePoint => $composableBuilder(
    column: $table.iconCodePoint,
    builder: (column) => column,
  );

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> budgetsRefs<T extends Object>(
    Expression<T> Function($$BudgetsTableAnnotationComposer a) f,
  ) {
    final $$BudgetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgets,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BudgetsTableAnnotationComposer(
            $db: $db,
            $table: $db.budgets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          CategoryRow,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (CategoryRow, $$CategoriesTableReferences),
          CategoryRow,
          PrefetchHooks Function({bool transactionsRefs, bool budgetsRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nameKk = const Value.absent(),
                Value<String> nameRu = const Value.absent(),
                Value<EntryType> type = const Value.absent(),
                Value<int?> iconCodePoint = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                nameKk: nameKk,
                nameRu: nameRu,
                type: type,
                iconCodePoint: iconCodePoint,
                colorValue: colorValue,
                isArchived: isArchived,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nameKk,
                required String nameRu,
                required EntryType type,
                Value<int?> iconCodePoint = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                nameKk: nameKk,
                nameRu: nameRu,
                type: type,
                iconCodePoint: iconCodePoint,
                colorValue: colorValue,
                isArchived: isArchived,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({transactionsRefs = false, budgetsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (transactionsRefs) db.transactions,
                    if (budgetsRefs) db.budgets,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transactionsRefs)
                        await $_getPrefetchedData<
                          CategoryRow,
                          $CategoriesTable,
                          TransactionRow
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._transactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (budgetsRefs)
                        await $_getPrefetchedData<
                          CategoryRow,
                          $CategoriesTable,
                          BudgetRow
                        >(
                          currentTable: table,
                          referencedTable: $$CategoriesTableReferences
                              ._budgetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).budgetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      CategoryRow,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (CategoryRow, $$CategoriesTableReferences),
      CategoryRow,
      PrefetchHooks Function({bool transactionsRefs, bool budgetsRefs})
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      Value<int> id,
      required int accountId,
      Value<int?> categoryId,
      required int amountMinor,
      required EntryType type,
      required DateTime date,
      Value<String?> note,
      Value<String?> merchant,
      Value<TransactionSource> source,
      Value<TransactionStatus> status,
      Value<DateTime> createdAt,
      Value<String?> importHash,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<int> id,
      Value<int> accountId,
      Value<int?> categoryId,
      Value<int> amountMinor,
      Value<EntryType> type,
      Value<DateTime> date,
      Value<String?> note,
      Value<String?> merchant,
      Value<TransactionSource> source,
      Value<TransactionStatus> status,
      Value<DateTime> createdAt,
      Value<String?> importHash,
    });

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, TransactionRow> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountsTable _accountIdTable(_$AppDatabase db) =>
      db.accounts.createAlias(
        $_aliasNameGenerator(db.transactions.accountId, db.accounts.id),
      );

  $$AccountsTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountsTableTableManager(
      $_db,
      $_db.accounts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.transactions.categoryId, db.categories.id),
      );

  $$CategoriesTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<int>('category_id');
    if ($_column == null) return null;
    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EntryType, EntryType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get merchant => $composableBuilder(
    column: $table.merchant,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TransactionSource, TransactionSource, int>
  get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<TransactionStatus, TransactionStatus, int>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get importHash => $composableBuilder(
    column: $table.importHash,
    builder: (column) => ColumnFilters(column),
  );

  $$AccountsTableFilterComposer get accountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableFilterComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get merchant => $composableBuilder(
    column: $table.merchant,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get importHash => $composableBuilder(
    column: $table.importHash,
    builder: (column) => ColumnOrderings(column),
  );

  $$AccountsTableOrderingComposer get accountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableOrderingComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<EntryType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get merchant =>
      $composableBuilder(column: $table.merchant, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TransactionSource, int> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TransactionStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get importHash => $composableBuilder(
    column: $table.importHash,
    builder: (column) => column,
  );

  $$AccountsTableAnnotationComposer get accountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountId,
      referencedTable: $db.accounts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountsTableAnnotationComposer(
            $db: $db,
            $table: $db.accounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          TransactionRow,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (TransactionRow, $$TransactionsTableReferences),
          TransactionRow,
          PrefetchHooks Function({bool accountId, bool categoryId})
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<EntryType> type = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> merchant = const Value.absent(),
                Value<TransactionSource> source = const Value.absent(),
                Value<TransactionStatus> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> importHash = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                amountMinor: amountMinor,
                type: type,
                date: date,
                note: note,
                merchant: merchant,
                source: source,
                status: status,
                createdAt: createdAt,
                importHash: importHash,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int accountId,
                Value<int?> categoryId = const Value.absent(),
                required int amountMinor,
                required EntryType type,
                required DateTime date,
                Value<String?> note = const Value.absent(),
                Value<String?> merchant = const Value.absent(),
                Value<TransactionSource> source = const Value.absent(),
                Value<TransactionStatus> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> importHash = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                amountMinor: amountMinor,
                type: type,
                date: date,
                note: note,
                merchant: merchant,
                source: source,
                status: status,
                createdAt: createdAt,
                importHash: importHash,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (accountId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accountId,
                                referencedTable: $$TransactionsTableReferences
                                    ._accountIdTable(db),
                                referencedColumn: $$TransactionsTableReferences
                                    ._accountIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable: $$TransactionsTableReferences
                                    ._categoryIdTable(db),
                                referencedColumn: $$TransactionsTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      TransactionRow,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (TransactionRow, $$TransactionsTableReferences),
      TransactionRow,
      PrefetchHooks Function({bool accountId, bool categoryId})
    >;
typedef $$BudgetsTableCreateCompanionBuilder =
    BudgetsCompanion Function({
      Value<int> id,
      required int categoryId,
      Value<BudgetPeriod> period,
      required int limitMinor,
      Value<DateTime> createdAt,
    });
typedef $$BudgetsTableUpdateCompanionBuilder =
    BudgetsCompanion Function({
      Value<int> id,
      Value<int> categoryId,
      Value<BudgetPeriod> period,
      Value<int> limitMinor,
      Value<DateTime> createdAt,
    });

final class $$BudgetsTableReferences
    extends BaseReferences<_$AppDatabase, $BudgetsTable, BudgetRow> {
  $$BudgetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.budgets.categoryId, db.categories.id),
      );

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BudgetsTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<BudgetPeriod, BudgetPeriod, int> get period =>
      $composableBuilder(
        column: $table.period,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get limitMinor => $composableBuilder(
    column: $table.limitMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetsTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get limitMinor => $composableBuilder(
    column: $table.limitMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BudgetPeriod, int> get period =>
      $composableBuilder(column: $table.period, builder: (column) => column);

  GeneratedColumn<int> get limitMinor => $composableBuilder(
    column: $table.limitMinor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BudgetsTable,
          BudgetRow,
          $$BudgetsTableFilterComposer,
          $$BudgetsTableOrderingComposer,
          $$BudgetsTableAnnotationComposer,
          $$BudgetsTableCreateCompanionBuilder,
          $$BudgetsTableUpdateCompanionBuilder,
          (BudgetRow, $$BudgetsTableReferences),
          BudgetRow,
          PrefetchHooks Function({bool categoryId})
        > {
  $$BudgetsTableTableManager(_$AppDatabase db, $BudgetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<BudgetPeriod> period = const Value.absent(),
                Value<int> limitMinor = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BudgetsCompanion(
                id: id,
                categoryId: categoryId,
                period: period,
                limitMinor: limitMinor,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int categoryId,
                Value<BudgetPeriod> period = const Value.absent(),
                required int limitMinor,
                Value<DateTime> createdAt = const Value.absent(),
              }) => BudgetsCompanion.insert(
                id: id,
                categoryId: categoryId,
                period: period,
                limitMinor: limitMinor,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BudgetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable: $$BudgetsTableReferences
                                    ._categoryIdTable(db),
                                referencedColumn: $$BudgetsTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BudgetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BudgetsTable,
      BudgetRow,
      $$BudgetsTableFilterComposer,
      $$BudgetsTableOrderingComposer,
      $$BudgetsTableAnnotationComposer,
      $$BudgetsTableCreateCompanionBuilder,
      $$BudgetsTableUpdateCompanionBuilder,
      (BudgetRow, $$BudgetsTableReferences),
      BudgetRow,
      PrefetchHooks Function({bool categoryId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$BudgetsTableTableManager get budgets =>
      $$BudgetsTableTableManager(_db, _db.budgets);
}
