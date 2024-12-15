// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Filter {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) directory,
    required TResult Function(String value) name,
    required TResult Function(String value) id,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool value)? directory,
    TResult? Function(String value)? name,
    TResult? Function(String value)? id,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? directory,
    TResult Function(String value)? name,
    TResult Function(String value)? id,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectoryFilter value) directory,
    required TResult Function(NameFilter value) name,
    required TResult Function(IDFilter value) id,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectoryFilter value)? directory,
    TResult? Function(NameFilter value)? name,
    TResult? Function(IDFilter value)? id,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectoryFilter value)? directory,
    TResult Function(NameFilter value)? name,
    TResult Function(IDFilter value)? id,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCopyWith<$Res> {
  factory $FilterCopyWith(Filter value, $Res Function(Filter) then) =
      _$FilterCopyWithImpl<$Res, Filter>;
}

/// @nodoc
class _$FilterCopyWithImpl<$Res, $Val extends Filter>
    implements $FilterCopyWith<$Res> {
  _$FilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DirectoryFilterImplCopyWith<$Res> {
  factory _$$DirectoryFilterImplCopyWith(_$DirectoryFilterImpl value,
          $Res Function(_$DirectoryFilterImpl) then) =
      __$$DirectoryFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$DirectoryFilterImplCopyWithImpl<$Res>
    extends _$FilterCopyWithImpl<$Res, _$DirectoryFilterImpl>
    implements _$$DirectoryFilterImplCopyWith<$Res> {
  __$$DirectoryFilterImplCopyWithImpl(
      _$DirectoryFilterImpl _value, $Res Function(_$DirectoryFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DirectoryFilterImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DirectoryFilterImpl implements DirectoryFilter {
  const _$DirectoryFilterImpl(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'Filter.directory(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectoryFilterImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectoryFilterImplCopyWith<_$DirectoryFilterImpl> get copyWith =>
      __$$DirectoryFilterImplCopyWithImpl<_$DirectoryFilterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) directory,
    required TResult Function(String value) name,
    required TResult Function(String value) id,
  }) {
    return directory(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool value)? directory,
    TResult? Function(String value)? name,
    TResult? Function(String value)? id,
  }) {
    return directory?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? directory,
    TResult Function(String value)? name,
    TResult Function(String value)? id,
    required TResult orElse(),
  }) {
    if (directory != null) {
      return directory(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectoryFilter value) directory,
    required TResult Function(NameFilter value) name,
    required TResult Function(IDFilter value) id,
  }) {
    return directory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectoryFilter value)? directory,
    TResult? Function(NameFilter value)? name,
    TResult? Function(IDFilter value)? id,
  }) {
    return directory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectoryFilter value)? directory,
    TResult Function(NameFilter value)? name,
    TResult Function(IDFilter value)? id,
    required TResult orElse(),
  }) {
    if (directory != null) {
      return directory(this);
    }
    return orElse();
  }
}

abstract class DirectoryFilter implements Filter {
  const factory DirectoryFilter(final bool value) = _$DirectoryFilterImpl;

  @override
  bool get value;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectoryFilterImplCopyWith<_$DirectoryFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NameFilterImplCopyWith<$Res> {
  factory _$$NameFilterImplCopyWith(
          _$NameFilterImpl value, $Res Function(_$NameFilterImpl) then) =
      __$$NameFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$NameFilterImplCopyWithImpl<$Res>
    extends _$FilterCopyWithImpl<$Res, _$NameFilterImpl>
    implements _$$NameFilterImplCopyWith<$Res> {
  __$$NameFilterImplCopyWithImpl(
      _$NameFilterImpl _value, $Res Function(_$NameFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$NameFilterImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameFilterImpl implements NameFilter {
  const _$NameFilterImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'Filter.name(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameFilterImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameFilterImplCopyWith<_$NameFilterImpl> get copyWith =>
      __$$NameFilterImplCopyWithImpl<_$NameFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) directory,
    required TResult Function(String value) name,
    required TResult Function(String value) id,
  }) {
    return name(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool value)? directory,
    TResult? Function(String value)? name,
    TResult? Function(String value)? id,
  }) {
    return name?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? directory,
    TResult Function(String value)? name,
    TResult Function(String value)? id,
    required TResult orElse(),
  }) {
    if (name != null) {
      return name(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectoryFilter value) directory,
    required TResult Function(NameFilter value) name,
    required TResult Function(IDFilter value) id,
  }) {
    return name(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectoryFilter value)? directory,
    TResult? Function(NameFilter value)? name,
    TResult? Function(IDFilter value)? id,
  }) {
    return name?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectoryFilter value)? directory,
    TResult Function(NameFilter value)? name,
    TResult Function(IDFilter value)? id,
    required TResult orElse(),
  }) {
    if (name != null) {
      return name(this);
    }
    return orElse();
  }
}

abstract class NameFilter implements Filter {
  const factory NameFilter(final String value) = _$NameFilterImpl;

  @override
  String get value;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameFilterImplCopyWith<_$NameFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IDFilterImplCopyWith<$Res> {
  factory _$$IDFilterImplCopyWith(
          _$IDFilterImpl value, $Res Function(_$IDFilterImpl) then) =
      __$$IDFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$IDFilterImplCopyWithImpl<$Res>
    extends _$FilterCopyWithImpl<$Res, _$IDFilterImpl>
    implements _$$IDFilterImplCopyWith<$Res> {
  __$$IDFilterImplCopyWithImpl(
      _$IDFilterImpl _value, $Res Function(_$IDFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$IDFilterImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IDFilterImpl implements IDFilter {
  const _$IDFilterImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'Filter.id(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IDFilterImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IDFilterImplCopyWith<_$IDFilterImpl> get copyWith =>
      __$$IDFilterImplCopyWithImpl<_$IDFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) directory,
    required TResult Function(String value) name,
    required TResult Function(String value) id,
  }) {
    return id(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool value)? directory,
    TResult? Function(String value)? name,
    TResult? Function(String value)? id,
  }) {
    return id?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? directory,
    TResult Function(String value)? name,
    TResult Function(String value)? id,
    required TResult orElse(),
  }) {
    if (id != null) {
      return id(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectoryFilter value) directory,
    required TResult Function(NameFilter value) name,
    required TResult Function(IDFilter value) id,
  }) {
    return id(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectoryFilter value)? directory,
    TResult? Function(NameFilter value)? name,
    TResult? Function(IDFilter value)? id,
  }) {
    return id?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectoryFilter value)? directory,
    TResult Function(NameFilter value)? name,
    TResult Function(IDFilter value)? id,
    required TResult orElse(),
  }) {
    if (id != null) {
      return id(this);
    }
    return orElse();
  }
}

abstract class IDFilter implements Filter {
  const factory IDFilter(final String value) = _$IDFilterImpl;

  @override
  String get value;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IDFilterImplCopyWith<_$IDFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
