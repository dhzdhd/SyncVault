// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppError implements DiagnosticableTreeMixin {

 Object? get error; StackTrace? get stackTrace;
/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppErrorCopyWith<AppError> get copyWith => _$AppErrorCopyWithImpl<AppError>(this as AppError, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppError'))
    ..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('stackTrace', stackTrace));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppError(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppErrorCopyWith<$Res>  {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) _then) = _$AppErrorCopyWithImpl;
@useResult
$Res call({
 Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppErrorCopyWithImpl<$Res>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._self, this._then);

  final AppError _self;
  final $Res Function(AppError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(_self.copyWith(
error: freezed == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

}


/// @nodoc


class HttpError extends AppError with DiagnosticableTreeMixin {
  const HttpError(this.endpoint, this.status, this.response, this.error, this.stackTrace): super._();
  

 final  String endpoint;
 final  int status;
 final  dynamic response;
@override final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HttpErrorCopyWith<HttpError> get copyWith => _$HttpErrorCopyWithImpl<HttpError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppError.http'))
    ..add(DiagnosticsProperty('endpoint', endpoint))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('response', response))..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('stackTrace', stackTrace));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpError&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.response, response)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,endpoint,status,const DeepCollectionEquality().hash(response),const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppError.http(endpoint: $endpoint, status: $status, response: $response, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $HttpErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $HttpErrorCopyWith(HttpError value, $Res Function(HttpError) _then) = _$HttpErrorCopyWithImpl;
@override @useResult
$Res call({
 String endpoint, int status, dynamic response, Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$HttpErrorCopyWithImpl<$Res>
    implements $HttpErrorCopyWith<$Res> {
  _$HttpErrorCopyWithImpl(this._self, this._then);

  final HttpError _self;
  final $Res Function(HttpError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? endpoint = null,Object? status = null,Object? response = freezed,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(HttpError(
null == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String,null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as dynamic,freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class AuthError extends AppError with DiagnosticableTreeMixin {
  const AuthError(this.type, this.error, this.stackTrace): super._();
  

 final  AuthErrorType type;
@override final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorCopyWith<AuthError> get copyWith => _$AuthErrorCopyWithImpl<AuthError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppError.auth'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('stackTrace', stackTrace));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthError&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppError.auth(type: $type, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AuthErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) _then) = _$AuthErrorCopyWithImpl;
@override @useResult
$Res call({
 AuthErrorType type, Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$AuthErrorCopyWithImpl<$Res>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._self, this._then);

  final AuthError _self;
  final $Res Function(AuthError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(AuthError(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AuthErrorType,freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class ProviderError extends AppError with DiagnosticableTreeMixin {
  const ProviderError(this.provider, this.operation, this.error, this.stackTrace): super._();
  

 final  DriveProvider provider;
 final  ProviderOperationType operation;
@override final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderErrorCopyWith<ProviderError> get copyWith => _$ProviderErrorCopyWithImpl<ProviderError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppError.provider'))
    ..add(DiagnosticsProperty('provider', provider))..add(DiagnosticsProperty('operation', operation))..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('stackTrace', stackTrace));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderError&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.operation, operation) || other.operation == operation)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,provider,operation,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppError.provider(provider: $provider, operation: $operation, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ProviderErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $ProviderErrorCopyWith(ProviderError value, $Res Function(ProviderError) _then) = _$ProviderErrorCopyWithImpl;
@override @useResult
$Res call({
 DriveProvider provider, ProviderOperationType operation, Object? error, StackTrace? stackTrace
});


$DriveProviderCopyWith<$Res> get provider;

}
/// @nodoc
class _$ProviderErrorCopyWithImpl<$Res>
    implements $ProviderErrorCopyWith<$Res> {
  _$ProviderErrorCopyWithImpl(this._self, this._then);

  final ProviderError _self;
  final $Res Function(ProviderError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? operation = null,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(ProviderError(
null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as DriveProvider,null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as ProviderOperationType,freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriveProviderCopyWith<$Res> get provider {
  
  return $DriveProviderCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}
}

/// @nodoc


class StorageError extends AppError with DiagnosticableTreeMixin {
  const StorageError(this.type, this.provider, this.error, this.stackTrace): super._();
  

 final  StorageErrorType type;
 final  StorageProviderType provider;
@override final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageErrorCopyWith<StorageError> get copyWith => _$StorageErrorCopyWithImpl<StorageError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppError.storage'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('provider', provider))..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('stackTrace', stackTrace));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageError&&(identical(other.type, type) || other.type == type)&&(identical(other.provider, provider) || other.provider == provider)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,type,provider,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppError.storage(type: $type, provider: $provider, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $StorageErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $StorageErrorCopyWith(StorageError value, $Res Function(StorageError) _then) = _$StorageErrorCopyWithImpl;
@override @useResult
$Res call({
 StorageErrorType type, StorageProviderType provider, Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$StorageErrorCopyWithImpl<$Res>
    implements $StorageErrorCopyWith<$Res> {
  _$StorageErrorCopyWithImpl(this._self, this._then);

  final StorageError _self;
  final $Res Function(StorageError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? provider = null,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(StorageError(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StorageErrorType,null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as StorageProviderType,freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class ValidationError extends AppError with DiagnosticableTreeMixin {
  const ValidationError(this.reason, this.field, this.error, this.stackTrace): super._();
  

 final  String reason;
 final  String? field;
@override final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationErrorCopyWith<ValidationError> get copyWith => _$ValidationErrorCopyWithImpl<ValidationError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppError.validation'))
    ..add(DiagnosticsProperty('reason', reason))..add(DiagnosticsProperty('field', field))..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('stackTrace', stackTrace));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationError&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.field, field) || other.field == field)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,reason,field,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppError.validation(reason: $reason, field: $field, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ValidationErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $ValidationErrorCopyWith(ValidationError value, $Res Function(ValidationError) _then) = _$ValidationErrorCopyWithImpl;
@override @useResult
$Res call({
 String reason, String? field, Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$ValidationErrorCopyWithImpl<$Res>
    implements $ValidationErrorCopyWith<$Res> {
  _$ValidationErrorCopyWithImpl(this._self, this._then);

  final ValidationError _self;
  final $Res Function(ValidationError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? field = freezed,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(ValidationError(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class GeneralError extends AppError with DiagnosticableTreeMixin {
  const GeneralError(this.message, this.error, this.stackTrace): super._();
  

 final  String message;
@override final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralErrorCopyWith<GeneralError> get copyWith => _$GeneralErrorCopyWithImpl<GeneralError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppError.general'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('stackTrace', stackTrace));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralError&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppError.general(message: $message, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $GeneralErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory $GeneralErrorCopyWith(GeneralError value, $Res Function(GeneralError) _then) = _$GeneralErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$GeneralErrorCopyWithImpl<$Res>
    implements $GeneralErrorCopyWith<$Res> {
  _$GeneralErrorCopyWithImpl(this._self, this._then);

  final GeneralError _self;
  final $Res Function(GeneralError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(GeneralError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
