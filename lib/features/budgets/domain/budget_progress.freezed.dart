// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetProgress {

 int get id; int get categoryId; BudgetPeriod get period; int get limitMinor; int get spentMinor; String? get categoryNameKk; String? get categoryNameRu; int? get iconCodePoint; int? get colorValue;
/// Create a copy of BudgetProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetProgressCopyWith<BudgetProgress> get copyWith => _$BudgetProgressCopyWithImpl<BudgetProgress>(this as BudgetProgress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.period, period) || other.period == period)&&(identical(other.limitMinor, limitMinor) || other.limitMinor == limitMinor)&&(identical(other.spentMinor, spentMinor) || other.spentMinor == spentMinor)&&(identical(other.categoryNameKk, categoryNameKk) || other.categoryNameKk == categoryNameKk)&&(identical(other.categoryNameRu, categoryNameRu) || other.categoryNameRu == categoryNameRu)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,period,limitMinor,spentMinor,categoryNameKk,categoryNameRu,iconCodePoint,colorValue);

@override
String toString() {
  return 'BudgetProgress(id: $id, categoryId: $categoryId, period: $period, limitMinor: $limitMinor, spentMinor: $spentMinor, categoryNameKk: $categoryNameKk, categoryNameRu: $categoryNameRu, iconCodePoint: $iconCodePoint, colorValue: $colorValue)';
}


}

/// @nodoc
abstract mixin class $BudgetProgressCopyWith<$Res>  {
  factory $BudgetProgressCopyWith(BudgetProgress value, $Res Function(BudgetProgress) _then) = _$BudgetProgressCopyWithImpl;
@useResult
$Res call({
 int id, int categoryId, BudgetPeriod period, int limitMinor, int spentMinor, String? categoryNameKk, String? categoryNameRu, int? iconCodePoint, int? colorValue
});




}
/// @nodoc
class _$BudgetProgressCopyWithImpl<$Res>
    implements $BudgetProgressCopyWith<$Res> {
  _$BudgetProgressCopyWithImpl(this._self, this._then);

  final BudgetProgress _self;
  final $Res Function(BudgetProgress) _then;

/// Create a copy of BudgetProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? period = null,Object? limitMinor = null,Object? spentMinor = null,Object? categoryNameKk = freezed,Object? categoryNameRu = freezed,Object? iconCodePoint = freezed,Object? colorValue = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as BudgetPeriod,limitMinor: null == limitMinor ? _self.limitMinor : limitMinor // ignore: cast_nullable_to_non_nullable
as int,spentMinor: null == spentMinor ? _self.spentMinor : spentMinor // ignore: cast_nullable_to_non_nullable
as int,categoryNameKk: freezed == categoryNameKk ? _self.categoryNameKk : categoryNameKk // ignore: cast_nullable_to_non_nullable
as String?,categoryNameRu: freezed == categoryNameRu ? _self.categoryNameRu : categoryNameRu // ignore: cast_nullable_to_non_nullable
as String?,iconCodePoint: freezed == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int?,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetProgress].
extension BudgetProgressPatterns on BudgetProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetProgress value)  $default,){
final _that = this;
switch (_that) {
case _BudgetProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetProgress value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int categoryId,  BudgetPeriod period,  int limitMinor,  int spentMinor,  String? categoryNameKk,  String? categoryNameRu,  int? iconCodePoint,  int? colorValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetProgress() when $default != null:
return $default(_that.id,_that.categoryId,_that.period,_that.limitMinor,_that.spentMinor,_that.categoryNameKk,_that.categoryNameRu,_that.iconCodePoint,_that.colorValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int categoryId,  BudgetPeriod period,  int limitMinor,  int spentMinor,  String? categoryNameKk,  String? categoryNameRu,  int? iconCodePoint,  int? colorValue)  $default,) {final _that = this;
switch (_that) {
case _BudgetProgress():
return $default(_that.id,_that.categoryId,_that.period,_that.limitMinor,_that.spentMinor,_that.categoryNameKk,_that.categoryNameRu,_that.iconCodePoint,_that.colorValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int categoryId,  BudgetPeriod period,  int limitMinor,  int spentMinor,  String? categoryNameKk,  String? categoryNameRu,  int? iconCodePoint,  int? colorValue)?  $default,) {final _that = this;
switch (_that) {
case _BudgetProgress() when $default != null:
return $default(_that.id,_that.categoryId,_that.period,_that.limitMinor,_that.spentMinor,_that.categoryNameKk,_that.categoryNameRu,_that.iconCodePoint,_that.colorValue);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetProgress extends BudgetProgress {
  const _BudgetProgress({required this.id, required this.categoryId, required this.period, required this.limitMinor, required this.spentMinor, this.categoryNameKk, this.categoryNameRu, this.iconCodePoint, this.colorValue}): super._();
  

@override final  int id;
@override final  int categoryId;
@override final  BudgetPeriod period;
@override final  int limitMinor;
@override final  int spentMinor;
@override final  String? categoryNameKk;
@override final  String? categoryNameRu;
@override final  int? iconCodePoint;
@override final  int? colorValue;

/// Create a copy of BudgetProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetProgressCopyWith<_BudgetProgress> get copyWith => __$BudgetProgressCopyWithImpl<_BudgetProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.period, period) || other.period == period)&&(identical(other.limitMinor, limitMinor) || other.limitMinor == limitMinor)&&(identical(other.spentMinor, spentMinor) || other.spentMinor == spentMinor)&&(identical(other.categoryNameKk, categoryNameKk) || other.categoryNameKk == categoryNameKk)&&(identical(other.categoryNameRu, categoryNameRu) || other.categoryNameRu == categoryNameRu)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,period,limitMinor,spentMinor,categoryNameKk,categoryNameRu,iconCodePoint,colorValue);

@override
String toString() {
  return 'BudgetProgress(id: $id, categoryId: $categoryId, period: $period, limitMinor: $limitMinor, spentMinor: $spentMinor, categoryNameKk: $categoryNameKk, categoryNameRu: $categoryNameRu, iconCodePoint: $iconCodePoint, colorValue: $colorValue)';
}


}

/// @nodoc
abstract mixin class _$BudgetProgressCopyWith<$Res> implements $BudgetProgressCopyWith<$Res> {
  factory _$BudgetProgressCopyWith(_BudgetProgress value, $Res Function(_BudgetProgress) _then) = __$BudgetProgressCopyWithImpl;
@override @useResult
$Res call({
 int id, int categoryId, BudgetPeriod period, int limitMinor, int spentMinor, String? categoryNameKk, String? categoryNameRu, int? iconCodePoint, int? colorValue
});




}
/// @nodoc
class __$BudgetProgressCopyWithImpl<$Res>
    implements _$BudgetProgressCopyWith<$Res> {
  __$BudgetProgressCopyWithImpl(this._self, this._then);

  final _BudgetProgress _self;
  final $Res Function(_BudgetProgress) _then;

/// Create a copy of BudgetProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? period = null,Object? limitMinor = null,Object? spentMinor = null,Object? categoryNameKk = freezed,Object? categoryNameRu = freezed,Object? iconCodePoint = freezed,Object? colorValue = freezed,}) {
  return _then(_BudgetProgress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as BudgetPeriod,limitMinor: null == limitMinor ? _self.limitMinor : limitMinor // ignore: cast_nullable_to_non_nullable
as int,spentMinor: null == spentMinor ? _self.spentMinor : spentMinor // ignore: cast_nullable_to_non_nullable
as int,categoryNameKk: freezed == categoryNameKk ? _self.categoryNameKk : categoryNameKk // ignore: cast_nullable_to_non_nullable
as String?,categoryNameRu: freezed == categoryNameRu ? _self.categoryNameRu : categoryNameRu // ignore: cast_nullable_to_non_nullable
as String?,iconCodePoint: freezed == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int?,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
