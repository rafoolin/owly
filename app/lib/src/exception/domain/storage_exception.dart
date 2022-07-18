import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_exception.dart';

part 'storage_exception.freezed.dart';

@freezed
class StorageException with _$StorageException implements AppException {
  const factory StorageException.platformException(PlatformException e) =
      _PlatformException;
  const factory StorageException.unknown(Object e) = _UnknownException;

  const StorageException._();

  @override
  String toString() => when(
        platformException: ((e) => e.message ?? 'Platform not supported'),
        unknown: (e) => 'Unknown Exception',
      );

  @override
  String get errorMessage => toString();

  static StorageException toDomain(Object err) {
    if (err is PlatformException) {
      return StorageException.platformException(err);
    }
    return StorageException.unknown(err);
  }
}
