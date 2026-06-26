// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budgets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BudgetsState()';
}


}

/// @nodoc
class $BudgetsStateCopyWith<$Res>  {
$BudgetsStateCopyWith(BudgetsState _, $Res Function(BudgetsState) __);
}


/// Adds pattern-matching-related methods to [BudgetsState].
extension BudgetsStatePatterns on BudgetsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BudgetsLoading value)?  loading,TResult Function( BudgetsLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BudgetsLoading() when loading != null:
return loading(_that);case BudgetsLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BudgetsLoading value)  loading,required TResult Function( BudgetsLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case BudgetsLoading():
return loading(_that);case BudgetsLoaded():
return loaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BudgetsLoading value)?  loading,TResult? Function( BudgetsLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case BudgetsLoading() when loading != null:
return loading(_that);case BudgetsLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<BudgetProgress> budgets)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BudgetsLoading() when loading != null:
return loading();case BudgetsLoaded() when loaded != null:
return loaded(_that.budgets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<BudgetProgress> budgets)  loaded,}) {final _that = this;
switch (_that) {
case BudgetsLoading():
return loading();case BudgetsLoaded():
return loaded(_that.budgets);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<BudgetProgress> budgets)?  loaded,}) {final _that = this;
switch (_that) {
case BudgetsLoading() when loading != null:
return loading();case BudgetsLoaded() when loaded != null:
return loaded(_that.budgets);case _:
  return null;

}
}

}

/// @nodoc


class BudgetsLoading implements BudgetsState {
  const BudgetsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BudgetsState.loading()';
}


}




/// @nodoc


class BudgetsLoaded implements BudgetsState {
  const BudgetsLoaded(final  List<BudgetProgress> budgets): _budgets = budgets;
  

 final  List<BudgetProgress> _budgets;
 List<BudgetProgress> get budgets {
  if (_budgets is EqualUnmodifiableListView) return _budgets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_budgets);
}


/// Create a copy of BudgetsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetsLoadedCopyWith<BudgetsLoaded> get copyWith => _$BudgetsLoadedCopyWithImpl<BudgetsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetsLoaded&&const DeepCollectionEquality().equals(other._budgets, _budgets));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_budgets));

@override
String toString() {
  return 'BudgetsState.loaded(budgets: $budgets)';
}


}

/// @nodoc
abstract mixin class $BudgetsLoadedCopyWith<$Res> implements $BudgetsStateCopyWith<$Res> {
  factory $BudgetsLoadedCopyWith(BudgetsLoaded value, $Res Function(BudgetsLoaded) _then) = _$BudgetsLoadedCopyWithImpl;
@useResult
$Res call({
 List<BudgetProgress> budgets
});




}
/// @nodoc
class _$BudgetsLoadedCopyWithImpl<$Res>
    implements $BudgetsLoadedCopyWith<$Res> {
  _$BudgetsLoadedCopyWithImpl(this._self, this._then);

  final BudgetsLoaded _self;
  final $Res Function(BudgetsLoaded) _then;

/// Create a copy of BudgetsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? budgets = null,}) {
  return _then(BudgetsLoaded(
null == budgets ? _self._budgets : budgets // ignore: cast_nullable_to_non_nullable
as List<BudgetProgress>,
  ));
}


}

// dart format on
