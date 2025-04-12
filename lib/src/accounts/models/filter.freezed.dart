// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Filter {
  Object get value;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Filter &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'Filter(value: $value)';
  }
}

/// @nodoc
class $FilterCopyWith<$Res> {
  $FilterCopyWith(Filter _, $Res Function(Filter) __);
}

/// @nodoc

class DirectoryFilter implements Filter {
  const DirectoryFilter(this.value);

  @override
  final bool value;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DirectoryFilterCopyWith<DirectoryFilter> get copyWith =>
      _$DirectoryFilterCopyWithImpl<DirectoryFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DirectoryFilter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'Filter.directory(value: $value)';
  }
}

/// @nodoc
abstract mixin class $DirectoryFilterCopyWith<$Res>
    implements $FilterCopyWith<$Res> {
  factory $DirectoryFilterCopyWith(
          DirectoryFilter value, $Res Function(DirectoryFilter) _then) =
      _$DirectoryFilterCopyWithImpl;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class _$DirectoryFilterCopyWithImpl<$Res>
    implements $DirectoryFilterCopyWith<$Res> {
  _$DirectoryFilterCopyWithImpl(this._self, this._then);

  final DirectoryFilter _self;
  final $Res Function(DirectoryFilter) _then;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(DirectoryFilter(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class NameFilter implements Filter {
  const NameFilter(this.value);

  @override
  final String value;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NameFilterCopyWith<NameFilter> get copyWith =>
      _$NameFilterCopyWithImpl<NameFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NameFilter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'Filter.name(value: $value)';
  }
}

/// @nodoc
abstract mixin class $NameFilterCopyWith<$Res>
    implements $FilterCopyWith<$Res> {
  factory $NameFilterCopyWith(
          NameFilter value, $Res Function(NameFilter) _then) =
      _$NameFilterCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$NameFilterCopyWithImpl<$Res> implements $NameFilterCopyWith<$Res> {
  _$NameFilterCopyWithImpl(this._self, this._then);

  final NameFilter _self;
  final $Res Function(NameFilter) _then;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(NameFilter(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class IDFilter implements Filter {
  const IDFilter(this.value);

  @override
  final String value;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IDFilterCopyWith<IDFilter> get copyWith =>
      _$IDFilterCopyWithImpl<IDFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IDFilter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'Filter.id(value: $value)';
  }
}

/// @nodoc
abstract mixin class $IDFilterCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory $IDFilterCopyWith(IDFilter value, $Res Function(IDFilter) _then) =
      _$IDFilterCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$IDFilterCopyWithImpl<$Res> implements $IDFilterCopyWith<$Res> {
  _$IDFilterCopyWithImpl(this._self, this._then);

  final IDFilter _self;
  final $Res Function(IDFilter) _then;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(IDFilter(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
