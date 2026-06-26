// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionListItem {

 int get id; int get amountMinor; EntryType get type; DateTime get date; String get accountName; String get currency; String? get note; String? get merchant; String? get categoryNameKk; String? get categoryNameRu; int? get categoryIconCodePoint; int? get categoryColorValue;
/// Create a copy of TransactionListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionListItemCopyWith<TransactionListItem> get copyWith => _$TransactionListItemCopyWithImpl<TransactionListItem>(this as TransactionListItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.note, note) || other.note == note)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.categoryNameKk, categoryNameKk) || other.categoryNameKk == categoryNameKk)&&(identical(other.categoryNameRu, categoryNameRu) || other.categoryNameRu == categoryNameRu)&&(identical(other.categoryIconCodePoint, categoryIconCodePoint) || other.categoryIconCodePoint == categoryIconCodePoint)&&(identical(other.categoryColorValue, categoryColorValue) || other.categoryColorValue == categoryColorValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,amountMinor,type,date,accountName,currency,note,merchant,categoryNameKk,categoryNameRu,categoryIconCodePoint,categoryColorValue);

@override
String toString() {
  return 'TransactionListItem(id: $id, amountMinor: $amountMinor, type: $type, date: $date, accountName: $accountName, currency: $currency, note: $note, merchant: $merchant, categoryNameKk: $categoryNameKk, categoryNameRu: $categoryNameRu, categoryIconCodePoint: $categoryIconCodePoint, categoryColorValue: $categoryColorValue)';
}


}

/// @nodoc
abstract mixin class $TransactionListItemCopyWith<$Res>  {
  factory $TransactionListItemCopyWith(TransactionListItem value, $Res Function(TransactionListItem) _then) = _$TransactionListItemCopyWithImpl;
@useResult
$Res call({
 int id, int amountMinor, EntryType type, DateTime date, String accountName, String currency, String? note, String? merchant, String? categoryNameKk, String? categoryNameRu, int? categoryIconCodePoint, int? categoryColorValue
});




}
/// @nodoc
class _$TransactionListItemCopyWithImpl<$Res>
    implements $TransactionListItemCopyWith<$Res> {
  _$TransactionListItemCopyWithImpl(this._self, this._then);

  final TransactionListItem _self;
  final $Res Function(TransactionListItem) _then;

/// Create a copy of TransactionListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amountMinor = null,Object? type = null,Object? date = null,Object? accountName = null,Object? currency = null,Object? note = freezed,Object? merchant = freezed,Object? categoryNameKk = freezed,Object? categoryNameRu = freezed,Object? categoryIconCodePoint = freezed,Object? categoryColorValue = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EntryType,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,merchant: freezed == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String?,categoryNameKk: freezed == categoryNameKk ? _self.categoryNameKk : categoryNameKk // ignore: cast_nullable_to_non_nullable
as String?,categoryNameRu: freezed == categoryNameRu ? _self.categoryNameRu : categoryNameRu // ignore: cast_nullable_to_non_nullable
as String?,categoryIconCodePoint: freezed == categoryIconCodePoint ? _self.categoryIconCodePoint : categoryIconCodePoint // ignore: cast_nullable_to_non_nullable
as int?,categoryColorValue: freezed == categoryColorValue ? _self.categoryColorValue : categoryColorValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionListItem].
extension TransactionListItemPatterns on TransactionListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionListItem value)  $default,){
final _that = this;
switch (_that) {
case _TransactionListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionListItem value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int amountMinor,  EntryType type,  DateTime date,  String accountName,  String currency,  String? note,  String? merchant,  String? categoryNameKk,  String? categoryNameRu,  int? categoryIconCodePoint,  int? categoryColorValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionListItem() when $default != null:
return $default(_that.id,_that.amountMinor,_that.type,_that.date,_that.accountName,_that.currency,_that.note,_that.merchant,_that.categoryNameKk,_that.categoryNameRu,_that.categoryIconCodePoint,_that.categoryColorValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int amountMinor,  EntryType type,  DateTime date,  String accountName,  String currency,  String? note,  String? merchant,  String? categoryNameKk,  String? categoryNameRu,  int? categoryIconCodePoint,  int? categoryColorValue)  $default,) {final _that = this;
switch (_that) {
case _TransactionListItem():
return $default(_that.id,_that.amountMinor,_that.type,_that.date,_that.accountName,_that.currency,_that.note,_that.merchant,_that.categoryNameKk,_that.categoryNameRu,_that.categoryIconCodePoint,_that.categoryColorValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int amountMinor,  EntryType type,  DateTime date,  String accountName,  String currency,  String? note,  String? merchant,  String? categoryNameKk,  String? categoryNameRu,  int? categoryIconCodePoint,  int? categoryColorValue)?  $default,) {final _that = this;
switch (_that) {
case _TransactionListItem() when $default != null:
return $default(_that.id,_that.amountMinor,_that.type,_that.date,_that.accountName,_that.currency,_that.note,_that.merchant,_that.categoryNameKk,_that.categoryNameRu,_that.categoryIconCodePoint,_that.categoryColorValue);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionListItem extends TransactionListItem {
  const _TransactionListItem({required this.id, required this.amountMinor, required this.type, required this.date, required this.accountName, this.currency = 'KZT', this.note, this.merchant, this.categoryNameKk, this.categoryNameRu, this.categoryIconCodePoint, this.categoryColorValue}): super._();
  

@override final  int id;
@override final  int amountMinor;
@override final  EntryType type;
@override final  DateTime date;
@override final  String accountName;
@override@JsonKey() final  String currency;
@override final  String? note;
@override final  String? merchant;
@override final  String? categoryNameKk;
@override final  String? categoryNameRu;
@override final  int? categoryIconCodePoint;
@override final  int? categoryColorValue;

/// Create a copy of TransactionListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionListItemCopyWith<_TransactionListItem> get copyWith => __$TransactionListItemCopyWithImpl<_TransactionListItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.note, note) || other.note == note)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.categoryNameKk, categoryNameKk) || other.categoryNameKk == categoryNameKk)&&(identical(other.categoryNameRu, categoryNameRu) || other.categoryNameRu == categoryNameRu)&&(identical(other.categoryIconCodePoint, categoryIconCodePoint) || other.categoryIconCodePoint == categoryIconCodePoint)&&(identical(other.categoryColorValue, categoryColorValue) || other.categoryColorValue == categoryColorValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,amountMinor,type,date,accountName,currency,note,merchant,categoryNameKk,categoryNameRu,categoryIconCodePoint,categoryColorValue);

@override
String toString() {
  return 'TransactionListItem(id: $id, amountMinor: $amountMinor, type: $type, date: $date, accountName: $accountName, currency: $currency, note: $note, merchant: $merchant, categoryNameKk: $categoryNameKk, categoryNameRu: $categoryNameRu, categoryIconCodePoint: $categoryIconCodePoint, categoryColorValue: $categoryColorValue)';
}


}

/// @nodoc
abstract mixin class _$TransactionListItemCopyWith<$Res> implements $TransactionListItemCopyWith<$Res> {
  factory _$TransactionListItemCopyWith(_TransactionListItem value, $Res Function(_TransactionListItem) _then) = __$TransactionListItemCopyWithImpl;
@override @useResult
$Res call({
 int id, int amountMinor, EntryType type, DateTime date, String accountName, String currency, String? note, String? merchant, String? categoryNameKk, String? categoryNameRu, int? categoryIconCodePoint, int? categoryColorValue
});




}
/// @nodoc
class __$TransactionListItemCopyWithImpl<$Res>
    implements _$TransactionListItemCopyWith<$Res> {
  __$TransactionListItemCopyWithImpl(this._self, this._then);

  final _TransactionListItem _self;
  final $Res Function(_TransactionListItem) _then;

/// Create a copy of TransactionListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amountMinor = null,Object? type = null,Object? date = null,Object? accountName = null,Object? currency = null,Object? note = freezed,Object? merchant = freezed,Object? categoryNameKk = freezed,Object? categoryNameRu = freezed,Object? categoryIconCodePoint = freezed,Object? categoryColorValue = freezed,}) {
  return _then(_TransactionListItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EntryType,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,merchant: freezed == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String?,categoryNameKk: freezed == categoryNameKk ? _self.categoryNameKk : categoryNameKk // ignore: cast_nullable_to_non_nullable
as String?,categoryNameRu: freezed == categoryNameRu ? _self.categoryNameRu : categoryNameRu // ignore: cast_nullable_to_non_nullable
as String?,categoryIconCodePoint: freezed == categoryIconCodePoint ? _self.categoryIconCodePoint : categoryIconCodePoint // ignore: cast_nullable_to_non_nullable
as int?,categoryColorValue: freezed == categoryColorValue ? _self.categoryColorValue : categoryColorValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
