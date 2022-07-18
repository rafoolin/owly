import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nhost_sdk/nhost_sdk.dart';

import '../../../exception/domain/app_exception.dart';

part 'auth_exception.freezed.dart';

extension NhostExceptionX on NhostException {
  AuthException toAuthException() {
    if (this is ApiException) {
      return AuthException.apiException(this as ApiException);
    } else if (this is AuthServiceException) {
      return AuthException.authServiceException(this as AuthServiceException);
    }
    return AuthException.unknown(this);
  }
}

@freezed
class AuthException with _$AuthException implements AppException {
  const factory AuthException.apiException(ApiException e) = _APIException;
  const factory AuthException.authServiceException(AuthServiceException e) =
      _AuthServiceException;
  const factory AuthException.clientException(ClientException e) =
      _ClientException;

  const factory AuthException.argumentError(ArgumentError e) = _ArgumentError;

  const factory AuthException.unknown(Object e) = _UnknownException;

  const AuthException._();

  @override
  String toString() => when(
        apiException: ((e) => jsonDecode(e.response.body)['message']),
        authServiceException: ((e) => e.message),
        clientException: (e) => e.message,
        argumentError: (e) => e.message,
        unknown: (e) => 'Unknown Exception',
      );

  @override
  String get errorMessage => toString();

  static AuthException toDomain(Object err) {
    if (err is NhostException) {
      return err.toAuthException();
    } else if (err is ApiException) {
      return AuthException.apiException(err);
    } else if (err is AuthServiceException) {
      return AuthException.authServiceException(err);
    } else if (err is ClientException) {
      return AuthException.clientException(err);
    } else if (err is ArgumentError) {
      return AuthException.argumentError(err);
    }
    return AuthException.unknown(err);
  }
}
