// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drafts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DraftsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DraftsState()';
}


}

/// @nodoc
class $DraftsStateCopyWith<$Res>  {
$DraftsStateCopyWith(DraftsState _, $Res Function(DraftsState) __);
}


/// Adds pattern-matching-related methods to [DraftsState].
extension DraftsStatePatterns on DraftsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DraftsLoading value)?  loading,TResult Function( DraftsLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DraftsLoading() when loading != null:
return loading(_that);case DraftsLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DraftsLoading value)  loading,required TResult Function( DraftsLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case DraftsLoading():
return loading(_that);case DraftsLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DraftsLoading value)?  loading,TResult? Function( DraftsLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case DraftsLoading() when loading != null:
return loading(_that);case DraftsLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<TransactionListItem> drafts)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DraftsLoading() when loading != null:
return loading();case DraftsLoaded() when loaded != null:
return loaded(_that.drafts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<TransactionListItem> drafts)  loaded,}) {final _that = this;
switch (_that) {
case DraftsLoading():
return loading();case DraftsLoaded():
return loaded(_that.drafts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<TransactionListItem> drafts)?  loaded,}) {final _that = this;
switch (_that) {
case DraftsLoading() when loading != null:
return loading();case DraftsLoaded() when loaded != null:
return loaded(_that.drafts);case _:
  return null;

}
}

}

/// @nodoc


class DraftsLoading implements DraftsState {
  const DraftsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DraftsState.loading()';
}


}




/// @nodoc


class DraftsLoaded implements DraftsState {
  const DraftsLoaded(final  List<TransactionListItem> drafts): _drafts = drafts;
  

 final  List<TransactionListItem> _drafts;
 List<TransactionListItem> get drafts {
  if (_drafts is EqualUnmodifiableListView) return _drafts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drafts);
}


/// Create a copy of DraftsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftsLoadedCopyWith<DraftsLoaded> get copyWith => _$DraftsLoadedCopyWithImpl<DraftsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftsLoaded&&const DeepCollectionEquality().equals(other._drafts, _drafts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_drafts));

@override
String toString() {
  return 'DraftsState.loaded(drafts: $drafts)';
}


}

/// @nodoc
abstract mixin class $DraftsLoadedCopyWith<$Res> implements $DraftsStateCopyWith<$Res> {
  factory $DraftsLoadedCopyWith(DraftsLoaded value, $Res Function(DraftsLoaded) _then) = _$DraftsLoadedCopyWithImpl;
@useResult
$Res call({
 List<TransactionListItem> drafts
});




}
/// @nodoc
class _$DraftsLoadedCopyWithImpl<$Res>
    implements $DraftsLoadedCopyWith<$Res> {
  _$DraftsLoadedCopyWithImpl(this._self, this._then);

  final DraftsLoaded _self;
  final $Res Function(DraftsLoaded) _then;

/// Create a copy of DraftsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? drafts = null,}) {
  return _then(DraftsLoaded(
null == drafts ? _self._drafts : drafts // ignore: cast_nullable_to_non_nullable
as List<TransactionListItem>,
  ));
}


}

// dart format on
