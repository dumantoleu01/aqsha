// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsState()';
}


}

/// @nodoc
class $TransactionsStateCopyWith<$Res>  {
$TransactionsStateCopyWith(TransactionsState _, $Res Function(TransactionsState) __);
}


/// Adds pattern-matching-related methods to [TransactionsState].
extension TransactionsStatePatterns on TransactionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TransactionsLoading value)?  loading,TResult Function( TransactionsLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TransactionsLoading() when loading != null:
return loading(_that);case TransactionsLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TransactionsLoading value)  loading,required TResult Function( TransactionsLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case TransactionsLoading():
return loading(_that);case TransactionsLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TransactionsLoading value)?  loading,TResult? Function( TransactionsLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case TransactionsLoading() when loading != null:
return loading(_that);case TransactionsLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<TransactionListItem> items)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TransactionsLoading() when loading != null:
return loading();case TransactionsLoaded() when loaded != null:
return loaded(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<TransactionListItem> items)  loaded,}) {final _that = this;
switch (_that) {
case TransactionsLoading():
return loading();case TransactionsLoaded():
return loaded(_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<TransactionListItem> items)?  loaded,}) {final _that = this;
switch (_that) {
case TransactionsLoading() when loading != null:
return loading();case TransactionsLoaded() when loaded != null:
return loaded(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class TransactionsLoading implements TransactionsState {
  const TransactionsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsState.loading()';
}


}




/// @nodoc


class TransactionsLoaded implements TransactionsState {
  const TransactionsLoaded(final  List<TransactionListItem> items): _items = items;
  

 final  List<TransactionListItem> _items;
 List<TransactionListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsLoadedCopyWith<TransactionsLoaded> get copyWith => _$TransactionsLoadedCopyWithImpl<TransactionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsLoaded&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'TransactionsState.loaded(items: $items)';
}


}

/// @nodoc
abstract mixin class $TransactionsLoadedCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory $TransactionsLoadedCopyWith(TransactionsLoaded value, $Res Function(TransactionsLoaded) _then) = _$TransactionsLoadedCopyWithImpl;
@useResult
$Res call({
 List<TransactionListItem> items
});




}
/// @nodoc
class _$TransactionsLoadedCopyWithImpl<$Res>
    implements $TransactionsLoadedCopyWith<$Res> {
  _$TransactionsLoadedCopyWithImpl(this._self, this._then);

  final TransactionsLoaded _self;
  final $Res Function(TransactionsLoaded) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(TransactionsLoaded(
null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionListItem>,
  ));
}


}

// dart format on
