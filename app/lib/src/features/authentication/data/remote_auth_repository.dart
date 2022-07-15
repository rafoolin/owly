import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nhost_sdk/nhost_sdk.dart';

import '../domain/auth_exception.dart';

class RemoteAuthRepository {
  final NhostClient _nhostClient;
  RemoteAuthRepository(this._nhostClient);

  /// Auth client
  AuthClient get auth => _nhostClient.auth;

  Future<AsyncValue<AuthResponse?>> signInEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _nhostClient.auth.signInEmailPassword(
        email: email,
        password: password,
      );
      return AsyncData(response);
    } catch (err) {
      return AsyncError(AuthException.toDomain(err));
    }
  }

  /// Sign out user from the app.
  Future<AsyncValue<AuthResponse>> signOut() async {
    try {
      final response = await _nhostClient.auth.signOut();
      return AsyncData(response);
    } catch (err) {
      return AsyncError(AuthException.toDomain(err));
    }
  }

  Future<AsyncValue<AuthResponse>> signUp({
    required String email,
    required String password,
    String? locale,
    String? defaultRole,
    List<String>? roles,
    String? displayName,
    String? redirectTo,
  }) async {
    try {
      final response = await _nhostClient.auth.signUp(
        email: email,
        password: password,
        locale: locale,
        defaultRole: defaultRole,
        roles: roles,
        displayName: displayName,
        redirectTo: redirectTo,
      );
      return AsyncData(response);
    } catch (err) {
      return AsyncError(AuthException.toDomain(err));
    }
  }
}
