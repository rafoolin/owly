import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nhost_sdk/nhost_sdk.dart';
import 'package:owly/src/features/authentication/data/remote_auth_repository.dart';
import 'package:owly/src/features/authentication/domain/auth_exception.dart';

import 'remote_repository_test.mocks.dart';

const testEmail = 'user-1@nhost.io';
const testPassword = 'password-1';
final user = User(
  id: 'id',
  displayName: 'displayName',
  locale: 'en',
  createdAt: DateTime.now(),
  isAnonymous: false,
  defaultRole: 'user',
  roles: ['user', 'own'],
);
final authResponse = AuthResponse(session: Session(user: user));

@GenerateMocks([AuthClient])
void main() async {
  late RemoteAuthRepository remoteAuthRepository;
  late AuthClient authClient;

  setUp(() {
    authClient = MockAuthClient();
    remoteAuthRepository = RemoteAuthRepository(authClient);
  });

  group('signInEmailPassword -', () {
    test('Success', () async {
      when(
        authClient.signInEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
      ).thenAnswer((_) async => authResponse);

      expect(
        remoteAuthRepository.signInEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
        completes,
      );
      verify(authClient.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      ));
      expectLater(
        await remoteAuthRepository.signInEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
        AsyncData<AuthResponse?>(authResponse),
      );
    });
    test('Failure', () async {
      final exception = NhostException();

      when(
        authClient.signInEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
      ).thenThrow(exception);

      expectLater(
        await remoteAuthRepository.signInEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
        isA<AsyncError>(),
      );
      verify(remoteAuthRepository.signInEmailPassword(
        email: testEmail,
        password: testPassword,
      )).called(1);
      expectLater(
        await remoteAuthRepository.signInEmailPassword(
          email: testEmail,
          password: testPassword,
        ),
        AsyncError<AuthResponse?>(AuthException.toDomain(exception)),
      );
    });
  });

  group('signUp -', () {
    test('Success', () async {
      when(
        authClient.signUp(
          email: testEmail,
          password: testPassword,
          defaultRole: anyNamed('defaultRole'),
          displayName: anyNamed('displayName'),
          locale: anyNamed('locale'),
          redirectTo: anyNamed('redirectTo'),
          roles: anyNamed('roles'),
        ),
      ).thenAnswer((_) async => authResponse);

      expect(
        remoteAuthRepository.signUp(email: testEmail, password: testPassword),
        completes,
      );
      verify(
        authClient.signUp(
          email: testEmail,
          password: testPassword,
        ),
      ).called(1);
      expectLater(
        await remoteAuthRepository.signUp(
          email: testEmail,
          password: testPassword,
        ),
        AsyncData<AuthResponse>(authResponse),
      );
    });
    test('Failure', () async {
      final exception = NhostException();

      when(
        authClient.signUp(
          email: testEmail,
          password: testPassword,
          defaultRole: anyNamed('defaultRole'),
          displayName: anyNamed('displayName'),
          locale: anyNamed('locale'),
          redirectTo: anyNamed('redirectTo'),
          roles: anyNamed('roles'),
        ),
      ).thenThrow(exception);

      expectLater(
        await remoteAuthRepository.signUp(
          email: testEmail,
          password: testPassword,
        ),
        isA<AsyncError>(),
      );
      verify(
        remoteAuthRepository.signUp(
          email: testEmail,
          password: testPassword,
        ),
      ).called(1);
      expectLater(
        await remoteAuthRepository.signUp(
          email: testEmail,
          password: testPassword,
        ),
        AsyncError<AuthResponse>(AuthException.toDomain(exception)),
      );
    });
  });

  group('signOut -', () {
    test('Success', () async {
      when(authClient.signOut()).thenAnswer((_) async => authResponse);

      expect(
        remoteAuthRepository.signOut(),
        completes,
      );
      verify(authClient.signOut()).called(1);
      expectLater(
        await remoteAuthRepository.signOut(),
        AsyncData<AuthResponse>(authResponse),
      );
    });
    test('Failure', () async {
      final exception = NhostException();

      when(authClient.signOut()).thenThrow(exception);

      expectLater(
        await remoteAuthRepository.signOut(),
        isA<AsyncError>(),
      );
      verify(remoteAuthRepository.signOut()).called(1);
      expectLater(
        await remoteAuthRepository.signOut(),
        AsyncError<AuthResponse>(AuthException.toDomain(exception)),
      );
    });
  });

  group('resetPassword -', () {
    test('Success', () async {
      when(authClient.resetPassword(email: testEmail))
          .thenAnswer((_) async => Future.value());

      expect(
        remoteAuthRepository.resetPassword(testEmail),
        completes,
      );
      verify(authClient.resetPassword(email: testEmail));
    });
    test('Failure', () async {
      final exception = NhostException();

      when(authClient.resetPassword(email: testEmail)).thenThrow(exception);

      expectLater(
        await remoteAuthRepository.resetPassword(testEmail),
        isA<AsyncError>(),
      );
      verify(remoteAuthRepository.resetPassword(testEmail)).called(1);
      expectLater(
        await remoteAuthRepository.resetPassword(testEmail),
        AsyncError<void>(AuthException.toDomain(exception)),
      );
    });
  });
}
