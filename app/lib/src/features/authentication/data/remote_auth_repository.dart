import 'package:nhost_sdk/nhost_sdk.dart';

import '../domain/auth_exception.dart';

class D implements Exception {}

class RemoteAuthRepository {
  final AuthClient _authClient;
  RemoteAuthRepository(this._authClient);

  /// The currently logged-in user's Json Web Token, or null if unauthenticated.
  String? get accessToken => _authClient.accessToken;

  /// Currently logged-in user, or null if unauthenticated.
  User? get currentUser => _authClient.currentUser;

  /// Add a callback that will be invoked when the service's
  /// authentication state changes.
  ///
  /// The returned function will remove the callback when called.
  void Function(void Function(AuthenticationState authenticationState))
      get addAuthStateChangedCallback =>
          _authClient.addAuthStateChangedCallback;

  /// Whether a user is logged in, not logged in, or if a sign-in is in process.
  AuthenticationState get authenticationState =>
      _authClient.authenticationState;

  Future<AuthResponse?> signInEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authClient.signInEmailPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (err) {
      throw AuthException.toDomain(err);
    }
  }

  /// Sign out user from the app.
  Future<AuthResponse> signOut() async {
    try {
      final response = await _authClient.signOut();
      return response;
    } catch (err) {
      throw AuthException.toDomain(err);
    }
  }

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    String? locale,
    String? defaultRole,
    List<String>? roles,
    String? displayName,
    String? redirectTo,
  }) async {
    try {
      final response = await _authClient.signUp(
        email: email,
        password: password,
        locale: locale,
        defaultRole: defaultRole,
        roles: roles,
        displayName: displayName,
        redirectTo: redirectTo,
      );
      return response;
    } catch (err) {
      throw AuthException.toDomain(err);
    }
  }

  /// Reset password for [email].
  Future<void> resetPassword(String email) async {
    try {
      final response = await _authClient.resetPassword(email: email);
      return response;
    } catch (err) {
      throw AuthException.toDomain(err);
    }
  }
}
