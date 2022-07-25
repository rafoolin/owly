import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nhost_sdk/nhost_sdk.dart';
import 'package:rxdart/rxdart.dart';

import '../../../common/models/app_credential.dart';
import '../data/local_auth_repository.dart';
import '../data/remote_auth_repository.dart';

class AuthService {
  final RemoteAuthRepository _remoteRepository;
  final LocalAuthRepository _localRepository;

  AuthService(this._remoteRepository, this._localRepository) {
    // Initialize the streams
    _currentUser.add(_remoteRepository.currentUser);
    _accessToken.add(_remoteRepository.accessToken);
    // With auth login feature, it takes some times to load the data from
    // secure local storage, so the nhost auth state is signed out, but loading
    // from local storage is in progress.
    // So we set it in the progress state and later it will be updated.
    _authenticationState.add(AuthenticationState.inProgress);
    // Try to sign in with locally saved credentials if there is any.
    signInEmailPassword();
    // Update streams on authentication state changes.
    _remoteRepository.addAuthStateChangedCallback(
      (authenticationState) {
        _currentUser.add(_remoteRepository.currentUser);
        _accessToken.add(_remoteRepository.accessToken);
        _authenticationState.add(_remoteRepository.authenticationState);
      },
    );
  }

  final _authenticationState =
      BehaviorSubject<AuthenticationState?>.seeded(null);

  final _currentUser = BehaviorSubject<User?>.seeded(null);

  final _accessToken = BehaviorSubject<String?>.seeded(null);

  ValueStream<User?> get currentUser => _currentUser.stream;
  ValueStream<String?> get accessToken => _accessToken.stream;
  ValueStream<AuthenticationState?> get authenticationState =>
      _authenticationState.stream;

  /// Sign in with [email] and [password].
  ///
  /// If both are passed we also update local storage for auto login feature.
  ///
  /// If they are not passed, we try to fetch them from local storage and log in
  /// user.
  ///
  /// It throws an exception if no [email] and [password] were sent
  /// and no local data is available.
  Future<AsyncValue<AuthResponse?>> signInEmailPassword({
    String? email,
    String? password,
  }) async {
    assert(
      (email == null) ^ (password != null),
      'Either both [password] and [email] are null or none null',
    );
    try {
      AuthResponse? response;
      // Both [email] and [password] are provided so we try to sign in with them
      if (email != null && password != null) {
        response = await _remoteRepository.signInEmailPassword(
          email: email,
          password: password,
        );
        // Update credentials in local storage if login was successful
        await _localRepository.updateCredential(
          AppCredential(email: email, password: password),
        );
      } else {
        final credential = await _localRepository.getCredential();
        if (credential != null) {
          response = await _remoteRepository.signInEmailPassword(
            email: credential.email,
            password: credential.password,
          );
        }
      }

      // When signing in with local storage or remote failed, Sign out the user
      // and reset auth state to singed out.
      if (response == null) {
        await signOut();
      }
      return AsyncData(response);
    } catch (error) {
      await signOut();
      return AsyncError(error);
    }
  }

  /// Sign out user from the app and clear auto login credentials from local
  /// storage.
  Future<AsyncValue<AuthResponse>> signOut() async {
    try {
      _authenticationState.add(AuthenticationState.signedOut);
      final response = await _remoteRepository.signOut();
      await _localRepository.clearCredential();
      return AsyncData(response);
    } catch (e) {
      return AsyncError(e);
    }
  }

  /// Sign up user
  Future<AsyncValue<AuthResponse>> signUpEmailPassword({
    required String email,
    required String password,
    String? locale,
    String? defaultRole,
    List<String>? roles,
    String? displayName,
    String? redirectTo,
  }) async {
    try {
      final response = await _remoteRepository.signUp(
        email: email,
        password: password,
        locale: locale,
        defaultRole: defaultRole,
        roles: roles,
        displayName: displayName,
        redirectTo: redirectTo,
      );
      // when sign up was successful update local credentials
      await _localRepository.updateCredential(
        AppCredential(
          email: email,
          password: password,
        ),
      );
      return AsyncData(response);
    } catch (error) {
      return AsyncError(error);
    }
  }

  /// Reset password for [email].
  Future<AsyncValue<void>> resetPassword(String email) async {
    try {
      final response = await _remoteRepository.resetPassword(email);
      return AsyncData(response);
    } catch (e) {
      return AsyncError(e);
    }
  }

  void dispose() {
    _accessToken.close();
    _authenticationState.close();
    _currentUser.close();
  }
}
