import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nhost_sdk/nhost_sdk.dart';

import '../../../../private_credential/nhost.dart';
import '../application/auth_service.dart';
import '../data/local_auth_repository.dart';
import '../data/remote_auth_repository.dart';
import '../domain/sign_in_entry.dart';
import '../domain/sign_up_entry.dart';
import 'sign_in_state_notifier.dart';
import 'sign_up_state_notifier.dart';

final _nhostClientProvider = Provider<NhostClient>(
  (ref) {
    final client = NhostClient(backendUrl: NhostCredential.nhostBackendUrl);
    // Release the client when it is no longer needed.
    ref.onDispose(client.close);

    return client;
  },
);

final _authStateProvider = StreamProvider<AuthenticationState?>((ref) async* {
  yield* ref.watch(authServiceProvider).authenticationState;
});

final _currentUserStreamProvider = StreamProvider<User?>((ref) async* {
  yield* ref.watch(authServiceProvider).currentUser;
});

final _accessTokenStreamProvider = StreamProvider<String?>((ref) async* {
  yield* ref.watch(authServiceProvider).accessToken;
});

/// A provider for authentication status. [AuthenticationState]
final authenticationStateProvider = Provider<AuthenticationState?>((ref) {
  final auth = ref.watch(_authStateProvider);
  return auth is AsyncData ? auth.value : null;
});

/// A provider for access token.
final accessTokenProvider = Provider<String?>((ref) {
  final token = ref.watch(_accessTokenStreamProvider);
  return token is AsyncData ? token.value : null;
});

/// A provider for current user [User]
final currentUserProvider = Provider<User?>((ref) {
  final user = ref.watch(_currentUserStreamProvider);
  return user is AsyncData ? user.value : null;
});

final _remoteAuthRepositoryProvider = Provider<RemoteAuthRepository>((ref) {
  final nhostClient = ref.watch(_nhostClientProvider);
  return RemoteAuthRepository(nhostClient.auth);
});

final secureStorageProvider =
    Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());

final _localAuthRepositoryProvider = Provider<LocalAuthRepository>((ref) {
  return LocalAuthRepository(ref.watch(secureStorageProvider));
});

final authServiceProvider = Provider<AuthService>((ref) {
  final remoteAuthRepository = ref.watch(_remoteAuthRepositoryProvider);
  final localAuthRepository = ref.watch(_localAuthRepositoryProvider);
  final authService = AuthService(remoteAuthRepository, localAuthRepository);

  ref.onDispose(authService.dispose);

  return authService;
});

final signInStateNotifierProvider =
    StateNotifierProvider.autoDispose<SignInStateNotifier, SignInEntry>(
  (ref) {
    final authService = ref.watch(authServiceProvider);
    return SignInStateNotifier(authService);
  },
);

final signUpStateNotifierProvider =
    StateNotifierProvider.autoDispose<SignUpStateNotifier, SignUpEntry>(
  (ref) {
    final authService = ref.watch(authServiceProvider);
    return SignUpStateNotifier(authService);
  },
);
