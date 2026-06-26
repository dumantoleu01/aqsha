// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'period_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PeriodSummary {

 int get incomeMinor; int get expenseMinor; List<CategorySpending> get expenseByCategory;
/// Create a copy of PeriodSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeriodSummaryCopyWith<PeriodSummary> get copyWith => _$PeriodSummaryCopyWithImpl<PeriodSummary>(this as PeriodSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeriodSummary&&(identical(other.incomeMinor, incomeMinor) || other.incomeMinor == incomeMinor)&&(identical(other.expenseMinor, expenseMinor) || other.expenseMinor == expenseMinor)&&const DeepCollectionEquality().equals(other.expenseByCategory, expenseByCategory));
}


@override
int get hashCode => Object.hash(runtimeType,incomeMinor,expenseMinor,const DeepCollectionEquality().hash(expenseByCategory));

@override
String toString() {
  return 'PeriodSummary(incomeMinor: $incomeMinor, expenseMinor: $expenseMinor, expenseByCategory: $expenseByCategory)';
}


}

/// @nodoc
abstract mixin class $PeriodSummaryCopyWith<$Res>  {
  factory $PeriodSummaryCopyWith(PeriodSummary value, $Res Function(PeriodSummary) _then) = _$PeriodSummaryCopyWithImpl;
@useResult
$Res call({
 int incomeMinor, int expenseMinor, List<CategorySpending> expenseByCategory
});




}
/// @nodoc
class _$PeriodSummaryCopyWithImpl<$Res>
    implements $PeriodSummaryCopyWith<$Res> {
  _$PeriodSummaryCopyWithImpl(this._self, this._then);

  final PeriodSummary _self;
  final $Res Function(PeriodSummary) _then;

/// Create a copy of PeriodSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? incomeMinor = null,Object? expenseMinor = null,Object? expenseByCategory = null,}) {
  return _then(_self.copyWith(
incomeMinor: null == incomeMinor ? _self.incomeMinor : incomeMinor // ignore: cast_nullable_to_non_nullable
as int,expenseMinor: null == expenseMinor ? _self.expenseMinor : expenseMinor // ignore: cast_nullable_to_non_nullable
as int,expenseByCategory: null == expenseByCategory ? _self.expenseByCategory : expenseByCategory // ignore: cast_nullable_to_non_nullable
as List<CategorySpending>,
  ));
}

}


/// Adds pattern-matching-related methods to [PeriodSummary].
extension PeriodSummaryPatterns on PeriodSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeriodSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeriodSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeriodSummary value)  $default,){
final _that = this;
switch (_that) {
case _PeriodSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeriodSummary value)?  $default,){
final _that = this;
switch (_that) {
case _PeriodSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int incomeMinor,  int expenseMinor,  List<CategorySpending> expenseByCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeriodSummary() when $default != null:
return $default(_that.incomeMinor,_that.expenseMinor,_that.expenseByCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int incomeMinor,  int expenseMinor,  List<CategorySpending> expenseByCategory)  $default,) {final _that = this;
switch (_that) {
case _PeriodSummary():
return $default(_that.incomeMinor,_that.expenseMinor,_that.expenseByCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int incomeMinor,  int expenseMinor,  List<CategorySpending> expenseByCategory)?  $default,) {final _that = this;
switch (_that) {
case _PeriodSummary() when $default != null:
return $default(_that.incomeMinor,_that.expenseMinor,_that.expenseByCategory);case _:
  return null;

}
}

}

/// @nodoc


class _PeriodSummary extends PeriodSummary {
  const _PeriodSummary({this.incomeMinor = 0, this.expenseMinor = 0, final  List<CategorySpending> expenseByCategory = const <CategorySpending>[]}): _expenseByCategory = expenseByCategory,super._();
  

@override@JsonKey() final  int incomeMinor;
@override@JsonKey() final  int expenseMinor;
 final  List<CategorySpending> _expenseByCategory;
@override@JsonKey() List<CategorySpending> get expenseByCategory {
  if (_expenseByCategory is EqualUnmodifiableListView) return _expenseByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenseByCategory);
}


/// Create a copy of PeriodSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeriodSummaryCopyWith<_PeriodSummary> get copyWith => __$PeriodSummaryCopyWithImpl<_PeriodSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeriodSummary&&(identical(other.incomeMinor, incomeMinor) || other.incomeMinor == incomeMinor)&&(identical(other.expenseMinor, expenseMinor) || other.expenseMinor == expenseMinor)&&const DeepCollectionEquality().equals(other._expenseByCategory, _expenseByCategory));
}


@override
int get hashCode => Object.hash(runtimeType,incomeMinor,expenseMinor,const DeepCollectionEquality().hash(_expenseByCategory));

@override
String toString() {
  return 'PeriodSummary(incomeMinor: $incomeMinor, expenseMinor: $expenseMinor, expenseByCategory: $expenseByCategory)';
}


}

/// @nodoc
abstract mixin class _$PeriodSummaryCopyWith<$Res> implements $PeriodSummaryCopyWith<$Res> {
  factory _$PeriodSummaryCopyWith(_PeriodSummary value, $Res Function(_PeriodSummary) _then) = __$PeriodSummaryCopyWithImpl;
@override @useResult
$Res call({
 int incomeMinor, int expenseMinor, List<CategorySpending> expenseByCategory
});




}
/// @nodoc
class __$PeriodSummaryCopyWithImpl<$Res>
    implements _$PeriodSummaryCopyWith<$Res> {
  __$PeriodSummaryCopyWithImpl(this._self, this._then);

  final _PeriodSummary _self;
  final $Res Function(_PeriodSummary) _then;

/// Create a copy of PeriodSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? incomeMinor = null,Object? expenseMinor = null,Object? expenseByCategory = null,}) {
  return _then(_PeriodSummary(
incomeMinor: null == incomeMinor ? _self.incomeMinor : incomeMinor // ignore: cast_nullable_to_non_nullable
as int,expenseMinor: null == expenseMinor ? _self.expenseMinor : expenseMinor // ignore: cast_nullable_to_non_nullable
as int,expenseByCategory: null == expenseByCategory ? _self._expenseByCategory : expenseByCategory // ignore: cast_nullable_to_non_nullable
as List<CategorySpending>,
  ));
}


}

// dart format on
