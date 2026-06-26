// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_spending.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategorySpending {

 int? get categoryId; String? get nameKk; String? get nameRu; int? get iconCodePoint; int? get colorValue; int get totalMinor;
/// Create a copy of CategorySpending
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategorySpendingCopyWith<CategorySpending> get copyWith => _$CategorySpendingCopyWithImpl<CategorySpending>(this as CategorySpending, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategorySpending&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.nameKk, nameKk) || other.nameKk == nameKk)&&(identical(other.nameRu, nameRu) || other.nameRu == nameRu)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.totalMinor, totalMinor) || other.totalMinor == totalMinor));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,nameKk,nameRu,iconCodePoint,colorValue,totalMinor);

@override
String toString() {
  return 'CategorySpending(categoryId: $categoryId, nameKk: $nameKk, nameRu: $nameRu, iconCodePoint: $iconCodePoint, colorValue: $colorValue, totalMinor: $totalMinor)';
}


}

/// @nodoc
abstract mixin class $CategorySpendingCopyWith<$Res>  {
  factory $CategorySpendingCopyWith(CategorySpending value, $Res Function(CategorySpending) _then) = _$CategorySpendingCopyWithImpl;
@useResult
$Res call({
 int? categoryId, String? nameKk, String? nameRu, int? iconCodePoint, int? colorValue, int totalMinor
});




}
/// @nodoc
class _$CategorySpendingCopyWithImpl<$Res>
    implements $CategorySpendingCopyWith<$Res> {
  _$CategorySpendingCopyWithImpl(this._self, this._then);

  final CategorySpending _self;
  final $Res Function(CategorySpending) _then;

/// Create a copy of CategorySpending
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = freezed,Object? nameKk = freezed,Object? nameRu = freezed,Object? iconCodePoint = freezed,Object? colorValue = freezed,Object? totalMinor = null,}) {
  return _then(_self.copyWith(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,nameKk: freezed == nameKk ? _self.nameKk : nameKk // ignore: cast_nullable_to_non_nullable
as String?,nameRu: freezed == nameRu ? _self.nameRu : nameRu // ignore: cast_nullable_to_non_nullable
as String?,iconCodePoint: freezed == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int?,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,totalMinor: null == totalMinor ? _self.totalMinor : totalMinor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategorySpending].
extension CategorySpendingPatterns on CategorySpending {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategorySpending value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategorySpending() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategorySpending value)  $default,){
final _that = this;
switch (_that) {
case _CategorySpending():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategorySpending value)?  $default,){
final _that = this;
switch (_that) {
case _CategorySpending() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? categoryId,  String? nameKk,  String? nameRu,  int? iconCodePoint,  int? colorValue,  int totalMinor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategorySpending() when $default != null:
return $default(_that.categoryId,_that.nameKk,_that.nameRu,_that.iconCodePoint,_that.colorValue,_that.totalMinor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? categoryId,  String? nameKk,  String? nameRu,  int? iconCodePoint,  int? colorValue,  int totalMinor)  $default,) {final _that = this;
switch (_that) {
case _CategorySpending():
return $default(_that.categoryId,_that.nameKk,_that.nameRu,_that.iconCodePoint,_that.colorValue,_that.totalMinor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? categoryId,  String? nameKk,  String? nameRu,  int? iconCodePoint,  int? colorValue,  int totalMinor)?  $default,) {final _that = this;
switch (_that) {
case _CategorySpending() when $default != null:
return $default(_that.categoryId,_that.nameKk,_that.nameRu,_that.iconCodePoint,_that.colorValue,_that.totalMinor);case _:
  return null;

}
}

}

/// @nodoc


class _CategorySpending extends CategorySpending {
  const _CategorySpending({this.categoryId, this.nameKk, this.nameRu, this.iconCodePoint, this.colorValue, required this.totalMinor}): super._();
  

@override final  int? categoryId;
@override final  String? nameKk;
@override final  String? nameRu;
@override final  int? iconCodePoint;
@override final  int? colorValue;
@override final  int totalMinor;

/// Create a copy of CategorySpending
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategorySpendingCopyWith<_CategorySpending> get copyWith => __$CategorySpendingCopyWithImpl<_CategorySpending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategorySpending&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.nameKk, nameKk) || other.nameKk == nameKk)&&(identical(other.nameRu, nameRu) || other.nameRu == nameRu)&&(identical(other.iconCodePoint, iconCodePoint) || other.iconCodePoint == iconCodePoint)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.totalMinor, totalMinor) || other.totalMinor == totalMinor));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,nameKk,nameRu,iconCodePoint,colorValue,totalMinor);

@override
String toString() {
  return 'CategorySpending(categoryId: $categoryId, nameKk: $nameKk, nameRu: $nameRu, iconCodePoint: $iconCodePoint, colorValue: $colorValue, totalMinor: $totalMinor)';
}


}

/// @nodoc
abstract mixin class _$CategorySpendingCopyWith<$Res> implements $CategorySpendingCopyWith<$Res> {
  factory _$CategorySpendingCopyWith(_CategorySpending value, $Res Function(_CategorySpending) _then) = __$CategorySpendingCopyWithImpl;
@override @useResult
$Res call({
 int? categoryId, String? nameKk, String? nameRu, int? iconCodePoint, int? colorValue, int totalMinor
});




}
/// @nodoc
class __$CategorySpendingCopyWithImpl<$Res>
    implements _$CategorySpendingCopyWith<$Res> {
  __$CategorySpendingCopyWithImpl(this._self, this._then);

  final _CategorySpending _self;
  final $Res Function(_CategorySpending) _then;

/// Create a copy of CategorySpending
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,Object? nameKk = freezed,Object? nameRu = freezed,Object? iconCodePoint = freezed,Object? colorValue = freezed,Object? totalMinor = null,}) {
  return _then(_CategorySpending(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,nameKk: freezed == nameKk ? _self.nameKk : nameKk // ignore: cast_nullable_to_non_nullable
as String?,nameRu: freezed == nameRu ? _self.nameRu : nameRu // ignore: cast_nullable_to_non_nullable
as String?,iconCodePoint: freezed == iconCodePoint ? _self.iconCodePoint : iconCodePoint // ignore: cast_nullable_to_non_nullable
as int?,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,totalMinor: null == totalMinor ? _self.totalMinor : totalMinor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
