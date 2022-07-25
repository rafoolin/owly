import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../common/constants/app_storage_key.dart';
import '../../../common/models/app_credential.dart';
import '../../../exception/domain/storage_exception.dart';

class LocalAuthRepository {
  final FlutterSecureStorage _storage;
  LocalAuthRepository(this._storage);

  /// Get locally saved credentials for auto login feature.
  Future<AppCredential?> getCredential() async {
    try {
      final email = await _storage.read(key: AppStorageKey.authEmail.key);
      final password = await _storage.read(key: AppStorageKey.authPassword.key);
      if (email == null || password == null) {
        return null;
      }
      return AppCredential(email: email, password: password);
    } catch (e) {
      throw StorageException.toDomain(e);
    }
  }

  /// Update saved and auto login credentials in the local storage.
  Future<AppCredential> updateCredential(
    AppCredential credential,
  ) async {
    try {
      // Update auto login password
      await _storage.write(
        key: AppStorageKey.authEmail.key,
        value: credential.email,
      );
      await _storage.write(
        key: AppStorageKey.authPassword.key,
        value: credential.password,
      );
      // Update saved password useful when user is logged-out
      // so we don't want to auto login them but want to show
      // them saved credentials
      await _storage.write(
        key: AppStorageKey.authSavedEmail.key,
        value: credential.email,
      );
      await _storage.write(
        key: AppStorageKey.authSavedPassword.key,
        value: credential.password,
      );

      return credential;
    } catch (e) {
      throw StorageException.toDomain(e);
    }
  }

  /// Clear auto login credentials.
  ///
  /// This is used when user log out from the app.
  ///
  /// We do **NOT** delete saved credentials to let user
  /// logging in back easily again.
  Future<void> clearCredential() async {
    try {
      await _storage.delete(key: AppStorageKey.authEmail.key);
      await _storage.delete(key: AppStorageKey.authPassword.key);
    } catch (e) {
      throw StorageException.toDomain(e);
    }
  }
}
