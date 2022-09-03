import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nhost_sdk/nhost_sdk.dart';
import 'package:owly/src/common/models/app_credential.dart';
import 'package:owly/src/exception/domain/storage_exception.dart';
import 'package:owly/src/features/authentication/application/auth_service.dart';
import 'package:owly/src/features/authentication/data/local_auth_repository.dart';
import 'package:owly/src/features/authentication/data/remote_auth_repository.dart';
import 'package:owly/src/features/authentication/domain/auth_exception.dart';
import '../data/remote_repository_test.dart';
import 'auth_service.dart_test.mocks.dart';

const testEmail = 'user-1@nhost.io';
const testPassword = 'password-1';
final credential = AppCredential(email: testEmail, password: testPassword);
const accessToken = 'accessToken';
final user = User(
  id: 'id',
  displayName: 'displayName',
  locale: 'en',
  createdAt: DateTime.now(),
  isAnonymous: false,
  defaultRole: 'user',
  roles: ['user', 'own'],
  metadata: {},
);

@GenerateMocks([RemoteAuthRepository, LocalAuthRepository])
void main() async {
  late RemoteAuthRepository remoteAuthRepository;
  late LocalAuthRepository localAuthRepository;
  late AuthService authService;

  setUp(() {
    remoteAuthRepository = MockRemoteAuthRepository();
    localAuthRepository = MockLocalAuthRepository();
    when(remoteAuthRepository.accessToken).thenReturn(null);
    when(remoteAuthRepository.currentUser).thenReturn(null);
    when(remoteAuthRepository.addAuthStateChangedCallback).thenReturn((a) {});
    when(localAuthRepository.getCredential()).thenAnswer((_) async => null);
  });

  tearDown(() {
    authService.dispose();
  });

  test('Set authState to [SignedOut] if local data is null on startup', () {
    authService = AuthService(remoteAuthRepository, localAuthRepository);
    expectLater(
      authService.authenticationState,
      emitsInOrder([
        AuthenticationState.inProgress,
        AuthenticationState.signedOut,
      ]),
      reason: 'First we set the authState as [inProgress]'
          'Then will be [signedOut]',
    );
  });

  group('signInEmailPassword -', () {
    test('[email] and [password] are NOT Null', () async {
      authService = AuthService(remoteAuthRepository, localAuthRepository);
      when(remoteAuthRepository.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      )).thenAnswer((_) async => authResponse);

      when(localAuthRepository.updateCredential(credential))
          .thenAnswer((_) async => credential);

      expectLater(
        await authService.signInEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
        AsyncData<AuthResponse?>(authResponse),
      );
      verify(remoteAuthRepository.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      ));
      verify(localAuthRepository.updateCredential(credential)).called(1);
    });

    test('[email] and [password] are Null, we have local data', () async {
      authService = AuthService(remoteAuthRepository, localAuthRepository);

      when(remoteAuthRepository.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      )).thenAnswer((_) async => authResponse);
      when(localAuthRepository.getCredential())
          .thenAnswer((_) async => credential);

      expectLater(
        await authService.signInEmailPassword(),
        AsyncData<AuthResponse?>(authResponse),
      );

      verify(remoteAuthRepository.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      ));
      verifyNever(localAuthRepository.updateCredential(credential));
      verify(localAuthRepository.getCredential()).called(2);
    });

    test('Sign in fail', () async {
      authService = AuthService(remoteAuthRepository, localAuthRepository);
      when(remoteAuthRepository.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      )).thenThrow(AuthException.toDomain(Exception()));

      when(remoteAuthRepository.signOut())
          .thenAnswer((_) async => authResponse);

      expectLater(
        await authService.signInEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
        isA<AsyncError>(),
      );
      verify(remoteAuthRepository.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      ));
      verifyNever(localAuthRepository.updateCredential(credential));
    });

    test('update credential fail', () async {
      authService = AuthService(remoteAuthRepository, localAuthRepository);
      when(remoteAuthRepository.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      )).thenAnswer((_) async => authResponse);

      when(localAuthRepository.updateCredential(credential))
          .thenThrow(Exception());

      expectLater(
        await authService.signInEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
        isA<AsyncError>(),
      );
      verify(remoteAuthRepository.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      ));
      verify(localAuthRepository.updateCredential(credential));
    });

    test('Get credential fail', () async {
      authService = AuthService(remoteAuthRepository, localAuthRepository);
      when(localAuthRepository.getCredential())
          .thenThrow(StorageException.toDomain(Exception()));

      expectLater(
        await authService.signInEmailPassword(),
        isA<AsyncError>(),
      );
      expectLater(
        authService.authenticationState,
        emits(AuthenticationState.signedOut),
        reason: '[getCredential] fail to load the data and'
            '[email] and [password] passed to sign in are also null',
      );
      verifyNever(remoteAuthRepository.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      ));
      verify(localAuthRepository.getCredential()).called(2);
    });
  });

  group('signOut', () {
    test('Success', () async {
      // Signed out response
      final response = AuthResponse();
      authService = AuthService(remoteAuthRepository, localAuthRepository);

      when(localAuthRepository.clearCredential())
          .thenAnswer((_) async => const AsyncData(null));

      when(remoteAuthRepository.signOut()).thenAnswer((_) async => response);

      expectLater(
        await authService.signOut(),
        AsyncData<AuthResponse>(response),
      );

      verify(remoteAuthRepository.signOut());
      verify(localAuthRepository.clearCredential());
    });

    test('Failure: clearCredential', () async {
      // Signed out response
      final response = AuthResponse();
      authService = AuthService(remoteAuthRepository, localAuthRepository);

      when(localAuthRepository.clearCredential()).thenThrow(Exception());
      when(remoteAuthRepository.signOut()).thenAnswer((_) async => response);

      expectLater(
        await authService.signOut(),
        isA<AsyncError>(),
      );

      verify(localAuthRepository.clearCredential());
      verify(remoteAuthRepository.signOut());
    });
    test('Failure: signOut', () async {
      authService = AuthService(remoteAuthRepository, localAuthRepository);

      when(localAuthRepository.clearCredential())
          .thenAnswer((_) async => Future.value());
      when(remoteAuthRepository.signOut()).thenThrow(Exception());

      expectLater(
        await authService.signOut(),
        isA<AsyncError>(),
      );

      verify(remoteAuthRepository.signOut());
      verifyNever(localAuthRepository.clearCredential());
    });
  });

  group('signUpEmailPassword', () {
    test('Success', () async {
      // Signed out response
      final response = AuthResponse();
      authService = AuthService(remoteAuthRepository, localAuthRepository);

      when(remoteAuthRepository.signUp(
        email: testEmail,
        password: testPassword,
      )).thenAnswer((_) async => response);

      when(localAuthRepository.updateCredential(credential))
          .thenAnswer((_) async => credential);

      when(remoteAuthRepository.signUp(
        email: testEmail,
        password: testPassword,
      )).thenAnswer((_) async => response);

      expectLater(
        await authService.signUpEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
        AsyncData<AuthResponse>(response),
      );

      verify(remoteAuthRepository.signUp(
        email: testEmail,
        password: testPassword,
      ));
      verify(localAuthRepository.updateCredential(credential)).called(1);
    });

    test('Failure: signUp', () async {
      authService = AuthService(remoteAuthRepository, localAuthRepository);

      when(remoteAuthRepository.signUp(
        email: testEmail,
        password: testPassword,
      )).thenThrow(AuthException.toDomain(Exception()));

      when(localAuthRepository.updateCredential(credential))
          .thenAnswer((_) async => credential);

      expectLater(
        await authService.signUpEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
        isA<AsyncError>(),
      );

      verify(remoteAuthRepository.signUp(
        email: testEmail,
        password: testPassword,
      ));
      verifyNever(localAuthRepository.updateCredential(credential));
    });
    test('Failure: updateCredential', () async {
      authService = AuthService(remoteAuthRepository, localAuthRepository);

      when(remoteAuthRepository.signUp(
        email: testEmail,
        password: testPassword,
      )).thenAnswer((_) async => authResponse);

      when(localAuthRepository.updateCredential(credential))
          .thenThrow(StorageException.toDomain(Exception()));

      expectLater(
        await authService.signUpEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
        isA<AsyncError>(),
      );

      verify(remoteAuthRepository.signUp(
        email: testEmail,
        password: testPassword,
      ));
      verify(localAuthRepository.updateCredential(credential));
    });
  });

  group('resetPassword', () {
    test('Success', () async {
      authService = AuthService(remoteAuthRepository, localAuthRepository);

      when(remoteAuthRepository.resetPassword(testEmail))
          .thenAnswer((_) async => Future.value());

      expectLater(
        await authService.resetPassword(testEmail),
        const AsyncData<void>(null),
      );

      verify(remoteAuthRepository.resetPassword(testEmail));
    });

    test('Failure', () async {
      authService = AuthService(remoteAuthRepository, localAuthRepository);

      when(remoteAuthRepository.resetPassword(testEmail))
          .thenThrow(AuthException.toDomain(Exception()));

      expectLater(
        await authService.resetPassword(testEmail),
        isA<AsyncError>(),
      );

      verify(remoteAuthRepository.resetPassword(testEmail));
    });
  });
}
