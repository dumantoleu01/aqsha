// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountsState()';
}


}

/// @nodoc
class $AccountsStateCopyWith<$Res>  {
$AccountsStateCopyWith(AccountsState _, $Res Function(AccountsState) __);
}


/// Adds pattern-matching-related methods to [AccountsState].
extension AccountsStatePatterns on AccountsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AccountsLoading value)?  loading,TResult Function( AccountsLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AccountsLoading() when loading != null:
return loading(_that);case AccountsLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AccountsLoading value)  loading,required TResult Function( AccountsLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case AccountsLoading():
return loading(_that);case AccountsLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AccountsLoading value)?  loading,TResult? Function( AccountsLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case AccountsLoading() when loading != null:
return loading(_that);case AccountsLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<Account> accounts)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AccountsLoading() when loading != null:
return loading();case AccountsLoaded() when loaded != null:
return loaded(_that.accounts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<Account> accounts)  loaded,}) {final _that = this;
switch (_that) {
case AccountsLoading():
return loading();case AccountsLoaded():
return loaded(_that.accounts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<Account> accounts)?  loaded,}) {final _that = this;
switch (_that) {
case AccountsLoading() when loading != null:
return loading();case AccountsLoaded() when loaded != null:
return loaded(_that.accounts);case _:
  return null;

}
}

}

/// @nodoc


class AccountsLoading implements AccountsState {
  const AccountsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountsState.loading()';
}


}




/// @nodoc


class AccountsLoaded implements AccountsState {
  const AccountsLoaded(final  List<Account> accounts): _accounts = accounts;
  

 final  List<Account> _accounts;
 List<Account> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}


/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountsLoadedCopyWith<AccountsLoaded> get copyWith => _$AccountsLoadedCopyWithImpl<AccountsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountsLoaded&&const DeepCollectionEquality().equals(other._accounts, _accounts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_accounts));

@override
String toString() {
  return 'AccountsState.loaded(accounts: $accounts)';
}


}

/// @nodoc
abstract mixin class $AccountsLoadedCopyWith<$Res> implements $AccountsStateCopyWith<$Res> {
  factory $AccountsLoadedCopyWith(AccountsLoaded value, $Res Function(AccountsLoaded) _then) = _$AccountsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Account> accounts
});




}
/// @nodoc
class _$AccountsLoadedCopyWithImpl<$Res>
    implements $AccountsLoadedCopyWith<$Res> {
  _$AccountsLoadedCopyWithImpl(this._self, this._then);

  final AccountsLoaded _self;
  final $Res Function(AccountsLoaded) _then;

/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accounts = null,}) {
  return _then(AccountsLoaded(
null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<Account>,
  ));
}


}

// dart format on
