// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parsed_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParsedEntry {

 DateTime get date; int get amountMinor; EntryType get type; String get description;
/// Create a copy of ParsedEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedEntryCopyWith<ParsedEntry> get copyWith => _$ParsedEntryCopyWithImpl<ParsedEntry>(this as ParsedEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedEntry&&(identical(other.date, date) || other.date == date)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,date,amountMinor,type,description);

@override
String toString() {
  return 'ParsedEntry(date: $date, amountMinor: $amountMinor, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class $ParsedEntryCopyWith<$Res>  {
  factory $ParsedEntryCopyWith(ParsedEntry value, $Res Function(ParsedEntry) _then) = _$ParsedEntryCopyWithImpl;
@useResult
$Res call({
 DateTime date, int amountMinor, EntryType type, String description
});




}
/// @nodoc
class _$ParsedEntryCopyWithImpl<$Res>
    implements $ParsedEntryCopyWith<$Res> {
  _$ParsedEntryCopyWithImpl(this._self, this._then);

  final ParsedEntry _self;
  final $Res Function(ParsedEntry) _then;

/// Create a copy of ParsedEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? amountMinor = null,Object? type = null,Object? description = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EntryType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ParsedEntry].
extension ParsedEntryPatterns on ParsedEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParsedEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParsedEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParsedEntry value)  $default,){
final _that = this;
switch (_that) {
case _ParsedEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParsedEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ParsedEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int amountMinor,  EntryType type,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParsedEntry() when $default != null:
return $default(_that.date,_that.amountMinor,_that.type,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int amountMinor,  EntryType type,  String description)  $default,) {final _that = this;
switch (_that) {
case _ParsedEntry():
return $default(_that.date,_that.amountMinor,_that.type,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int amountMinor,  EntryType type,  String description)?  $default,) {final _that = this;
switch (_that) {
case _ParsedEntry() when $default != null:
return $default(_that.date,_that.amountMinor,_that.type,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _ParsedEntry extends ParsedEntry {
  const _ParsedEntry({required this.date, required this.amountMinor, required this.type, required this.description}): super._();
  

@override final  DateTime date;
@override final  int amountMinor;
@override final  EntryType type;
@override final  String description;

/// Create a copy of ParsedEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsedEntryCopyWith<_ParsedEntry> get copyWith => __$ParsedEntryCopyWithImpl<_ParsedEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsedEntry&&(identical(other.date, date) || other.date == date)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,date,amountMinor,type,description);

@override
String toString() {
  return 'ParsedEntry(date: $date, amountMinor: $amountMinor, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ParsedEntryCopyWith<$Res> implements $ParsedEntryCopyWith<$Res> {
  factory _$ParsedEntryCopyWith(_ParsedEntry value, $Res Function(_ParsedEntry) _then) = __$ParsedEntryCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int amountMinor, EntryType type, String description
});




}
/// @nodoc
class __$ParsedEntryCopyWithImpl<$Res>
    implements _$ParsedEntryCopyWith<$Res> {
  __$ParsedEntryCopyWithImpl(this._self, this._then);

  final _ParsedEntry _self;
  final $Res Function(_ParsedEntry) _then;

/// Create a copy of ParsedEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? amountMinor = null,Object? type = null,Object? description = null,}) {
  return _then(_ParsedEntry(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EntryType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
