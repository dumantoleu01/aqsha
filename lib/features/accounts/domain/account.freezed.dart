// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Account {

 int get id; String get name; AccountType get type; String get currency; int get initialBalanceMinor; int get balanceMinor; int? get iconCodePoint; int? get colorValue; bool get isArchived; int get sortOrder;
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this as Account, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.initialBalanceMinor, initialBalanceMinor) || other.initialBalanceMinor == initialBalanceMinor)&&(identical(other.balanceMinor, balanceMinor) || other.balanceMinor == balanceMinor)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,currency,initialBalanceMinor,balanceMinor,iconCodePoint,colorValue,isArchived,sortOrder);

@override
String toString() {
  return 'Account(id: $id, name: $name, type: $type, currency: $currency, initialBalanceMinor: $initialBalanceMinor, balanceMinor: $balanceMinor, iconCodePoint: $iconCodePoint, colorValue: $colorValue, isArchived: $isArchived, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res>  {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@useResult
$Res call({
 int id, String name, AccountType type, String currency, int initialBalanceMinor, int balanceMinor, int? iconCodePoint, int? colorValue, bool isArchived, int sortOrder
});




}
/// @nodoc
class _$AccountCopyWithImpl<$Res>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? currency = null,Object? initialBalanceMinor = null,Object? balanceMinor = null,Object? iconCodePoint = freezed,Object? colorValue = freezed,Object? isArchived = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccountType,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,initialBalanceMinor: null == initialBalanceMinor ? _self.initialBalanceMinor : initialBalanceMinor // ignore: cast_nullable_to_non_nullable
as int,balanceMinor: null == balanceMinor ? _self.balanceMinor : balanceMinor // ignore: cast_nullable_to_non_nullable
as int,iconCodePoint: freezed == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int?,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Account].
extension AccountPatterns on Account {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Account value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Account value)  $default,){
final _that = this;
switch (_that) {
case _Account():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Account value)?  $default,){
final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  AccountType type,  String currency,  int initialBalanceMinor,  int balanceMinor,  int? iconCodePoint,  int? colorValue,  bool isArchived,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.currency,_that.initialBalanceMinor,_that.balanceMinor,_that.iconCodePoint,_that.colorValue,_that.isArchived,_that.sortOrder);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  AccountType type,  String currency,  int initialBalanceMinor,  int balanceMinor,  int? iconCodePoint,  int? colorValue,  bool isArchived,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _Account():
return $default(_that.id,_that.name,_that.type,_that.currency,_that.initialBalanceMinor,_that.balanceMinor,_that.iconCodePoint,_that.colorValue,_that.isArchived,_that.sortOrder);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  AccountType type,  String currency,  int initialBalanceMinor,  int balanceMinor,  int? iconCodePoint,  int? colorValue,  bool isArchived,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.currency,_that.initialBalanceMinor,_that.balanceMinor,_that.iconCodePoint,_that.colorValue,_that.isArchived,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc


class _Account extends Account {
  const _Account({required this.id, required this.name, required this.type, this.currency = 'KZT', this.initialBalanceMinor = 0, this.balanceMinor = 0, this.iconCodePoint, this.colorValue, this.isArchived = false, this.sortOrder = 0}): super._();
  

@override final  int id;
@override final  String name;
@override final  AccountType type;
@override@JsonKey() final  String currency;
@override@JsonKey() final  int initialBalanceMinor;
@override@JsonKey() final  int balanceMinor;
@override final  int? iconCodePoint;
@override final  int? colorValue;
@override@JsonKey() final  bool isArchived;
@override@JsonKey() final  int sortOrder;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCopyWith<_Account> get copyWith => __$AccountCopyWithImpl<_Account>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Account&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.initialBalanceMinor, initialBalanceMinor) || other.initialBalanceMinor == initialBalanceMinor)&&(identical(other.balanceMinor, balanceMinor) || other.balanceMinor == balanceMinor)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,currency,initialBalanceMinor,balanceMinor,iconCodePoint,colorValue,isArchived,sortOrder);

@override
String toString() {
  return 'Account(id: $id, name: $name, type: $type, currency: $currency, initialBalanceMinor: $initialBalanceMinor, balanceMinor: $balanceMinor, iconCodePoint: $iconCodePoint, colorValue: $colorValue, isArchived: $isArchived, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) = __$AccountCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, AccountType type, String currency, int initialBalanceMinor, int balanceMinor, int? iconCodePoint, int? colorValue, bool isArchived, int sortOrder
});




}
/// @nodoc
class __$AccountCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? currency = null,Object? initialBalanceMinor = null,Object? balanceMinor = null,Object? iconCodePoint = freezed,Object? colorValue = freezed,Object? isArchived = null,Object? sortOrder = null,}) {
  return _then(_Account(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccountType,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,initialBalanceMinor: null == initialBalanceMinor ? _self.initialBalanceMinor : initialBalanceMinor // ignore: cast_nullable_to_non_nullable
as int,balanceMinor: null == balanceMinor ? _self.balanceMinor : balanceMinor // ignore: cast_nullable_to_non_nullable
as int,iconCodePoint: freezed == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int?,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
