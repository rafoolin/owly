import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nhost_sdk/nhost_sdk.dart';
import 'package:rxdart/rxdart.dart';

import '../../../common/models/app_credential.dart';
import '../../../exception/domain/storage_exception.dart';
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
    AsyncValue<AuthResponse?> response = const AsyncData(null);
    if (email != null && password != null) {
      response = await _remoteRepository.signInEmailPassword(
        email: email,
        password: password,
      );
      // Update credentials in local storage if login was successful
      if (response is AsyncData) {
        await _localRepository.updateCredential(
          AppCredential(email: email, password: password),
        );
      }
    } else {
      final local = await _localRepository.getCredential();
      if (local is AsyncData) {
        final credential = local.value;
        if (credential != null) {
          response = await _remoteRepository.signInEmailPassword(
            email: credential.email,
            password: credential.password,
          );
        }
      }
    }
    // When signing in with local storage or remote failed, Sign out the user
    // and reset auth state to singed out.
    if (response is AsyncData && response.value == null) {
      _setAuthStateToSignedOut();
    } else if (response is AsyncError) {
      await _remoteRepository.signOut();
    }

    return response;
  }

  /// Sign out user from the app and clear auto login credentials from local
  /// storage.
  Future<AsyncValue<AuthResponse>> signOut() async {
    final response = await _localRepository.clearCredential();

    return response.when(
      data: ((data) async => _remoteRepository.signOut()),
      error: (err, _) => AsyncError(StorageException.toDomain(err)),
      loading: () => const AsyncLoading(),
    );
  }

  /// Sign up user
  Future<AsyncValue<Object>> signUpEmailPassword({
    required String email,
    required String password,
    String? locale,
    String? defaultRole,
    List<String>? roles,
    String? displayName,
    String? redirectTo,
  }) async {
    return _remoteRepository.signUp(
      email: email,
      password: password,
      locale: locale,
      defaultRole: defaultRole,
      roles: roles,
      displayName: displayName,
      redirectTo: redirectTo,
    );
  }

  /// Reset NHost auth state to signed out.
  void _setAuthStateToSignedOut() {
    _authenticationState.add(AuthenticationState.signedOut);
  }

  /// Reset password for [email].
  Future<AsyncValue<void>> resetPassword(String email) async {
    return _remoteRepository.resetPassword(email);
  }

  void dispose() {
    _accessToken.close();
    _authenticationState.close();
    _currentUser.close();
  }
}
