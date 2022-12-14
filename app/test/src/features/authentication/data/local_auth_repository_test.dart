import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:owly/src/common/constants/app_storage_key.dart';
import 'package:owly/src/common/models/app_credential.dart';
import 'package:owly/src/exception/domain/storage_exception.dart';
import 'package:owly/src/features/authentication/data/local_auth_repository.dart';
import 'local_auth_repository_test.mocks.dart';

const testEmail = 'user-1@nhost.io';
const testPassword = 'password-1';
final credential = AppCredential(email: testEmail, password: testPassword);

@GenerateMocks([FlutterSecureStorage])
void main() async {
  late FlutterSecureStorage storage;
  late LocalAuthRepository localAuthRepository;

  setUp(() {
    storage = MockFlutterSecureStorage();
    localAuthRepository = LocalAuthRepository(storage);
  });

  group('getCredential -', () {
    test('Locally saved [email] is Null', () async {
      when(storage.read(key: AppStorageKey.authEmail.key))
          .thenAnswer((_) async => null);

      when(storage.read(key: AppStorageKey.authPassword.key))
          .thenAnswer((_) async => testPassword);

      expect(localAuthRepository.getCredential(), completes);
      verify(localAuthRepository.getCredential());
      expectLater(
        await localAuthRepository.getCredential(),
        null,
        reason: 'when locally saved [email] is null, it returns null',
      );
      verify(storage.read(key: AppStorageKey.authEmail.key));
      verify(storage.read(key: AppStorageKey.authPassword.key));
    });
    test('Locally saved [password] is Null', () async {
      when(storage.read(key: AppStorageKey.authEmail.key))
          .thenAnswer((_) async => testEmail);

      when(storage.read(key: AppStorageKey.authPassword.key))
          .thenAnswer((_) async => null);

      expect(localAuthRepository.getCredential(), completes);
      verify(localAuthRepository.getCredential());
      expectLater(
        await localAuthRepository.getCredential(),
        null,
        reason: 'when locally saved [password] is null, it returns null',
      );
      verify(storage.read(key: AppStorageKey.authEmail.key));
      verify(storage.read(key: AppStorageKey.authPassword.key));
    });
    test('reading locally saved email and password succeed', () async {
      when(storage.read(key: AppStorageKey.authEmail.key))
          .thenAnswer((_) async => testEmail);

      when(storage.read(key: AppStorageKey.authPassword.key))
          .thenAnswer((_) async => testPassword);

      expect(localAuthRepository.getCredential(), completes);
      verify(localAuthRepository.getCredential());
      expectLater(
        await localAuthRepository.getCredential(),
        credential,
        reason: 'when locally saved [password] is null, it returns null',
      );
      verify(storage.read(key: AppStorageKey.authEmail.key));
      verify(storage.read(key: AppStorageKey.authPassword.key));
    });

    test('Reading locally saved [email] fails', () async {
      final exception = Exception();

      when(storage.read(key: AppStorageKey.authEmail.key)).thenThrow(exception);
      when(storage.read(key: AppStorageKey.authPassword.key))
          .thenAnswer((_) async => testPassword);

      Future<void> testFunction() async {
        await localAuthRepository.getCredential();
      }

      await expectLater(
        testFunction(),
        throwsA(isA<StorageException>()),
        reason: 'Throws a [StorageException] exception',
      );
      verify(storage.read(key: AppStorageKey.authEmail.key));
      verifyNever(storage.read(key: AppStorageKey.authPassword.key));
    });

    test('Reading locally saved [password] fails', () async {
      final exception = Exception();

      when(storage.read(key: AppStorageKey.authEmail.key))
          .thenAnswer((_) async => testEmail);

      when(storage.read(key: AppStorageKey.authPassword.key))
          .thenThrow(exception);

      Future<void> testFunction() async {
        await localAuthRepository.getCredential();
      }

      await expectLater(
        testFunction(),
        throwsA(isA<StorageException>()),
        reason: 'Throws a [StorageException] exception',
      );
      verify(storage.read(key: AppStorageKey.authEmail.key));
      verify(storage.read(key: AppStorageKey.authPassword.key));
    });
  });
  group('updateCredential -', () {
    test('Update local credential succeed', () async {
      when(storage.write(key: AppStorageKey.authEmail.key, value: testEmail))
          .thenAnswer((_) => Future.value());
      when(storage.write(
        key: AppStorageKey.authPassword.key,
        value: testPassword,
      )).thenAnswer((_) => Future.value());

      when(storage.write(
        key: AppStorageKey.authSavedEmail.key,
        value: testEmail,
      )).thenAnswer((_) => Future.value());

      when(storage.write(
        key: AppStorageKey.authSavedPassword.key,
        value: testPassword,
      )).thenAnswer((_) => Future.value());

      expect(localAuthRepository.updateCredential(credential), completes);
      verify(localAuthRepository.updateCredential(credential));
      expectLater(
        await localAuthRepository.updateCredential(credential),
        credential,
        reason: 'All local credentials are successfully updated',
      );
      verify(storage.write(key: AppStorageKey.authEmail.key, value: testEmail));
    });

    test('Update local credential fail', () async {
      final exception = Exception();

      when(storage.write(key: AppStorageKey.authEmail.key, value: testEmail))
          .thenThrow(exception);
      when(storage.write(
        key: AppStorageKey.authPassword.key,
        value: testPassword,
      )).thenAnswer((_) => Future.value());

      when(storage.write(
        key: AppStorageKey.authSavedEmail.key,
        value: testPassword,
      )).thenAnswer((_) => Future.value());

      when(storage.write(
        key: AppStorageKey.authSavedPassword.key,
        value: testPassword,
      )).thenAnswer((_) => Future.value());

      Future<void> testFunction() async {
        await localAuthRepository.updateCredential(credential);
      }

      expectLater(
        testFunction(),
        throwsA(isA<StorageException>()),
        reason: 'Failed to update [email] local storage',
      );
      verify(storage.write(key: AppStorageKey.authEmail.key, value: testEmail));
      verifyNever(
        storage.write(
          key: AppStorageKey.authPassword.key,
          value: testEmail,
        ),
      );
    });
  });
  group('clearCredential -', () {
    test('Clear local credential succeed', () async {
      when(storage.delete(key: AppStorageKey.authEmail.key))
          .thenAnswer((_) => Future.value());
      when(storage.delete(key: AppStorageKey.authPassword.key))
          .thenAnswer((_) => Future.value());

      expectLater(localAuthRepository.clearCredential(), completes);
      verify(localAuthRepository.clearCredential());
      await expectLater(
        localAuthRepository.clearCredential(),
        completes,
        reason: 'All local credentials are successfully cleared',
      );
      verify(storage.delete(key: AppStorageKey.authEmail.key));
      verify(storage.delete(key: AppStorageKey.authPassword.key));
    });

    test('Clear local credential fail', () async {
      final exception = Exception();

      when(storage.delete(key: AppStorageKey.authEmail.key))
          .thenThrow(exception);
      when(storage.delete(key: AppStorageKey.authPassword.key))
          .thenAnswer((_) => Future.value());

      await expectLater(
        localAuthRepository.clearCredential(),
        throwsA(isA<StorageException>()),
        reason: 'Failed to clear [email] local storage`s value',
      );
      verify(storage.delete(key: AppStorageKey.authEmail.key));
      verifyNever(storage.delete(key: AppStorageKey.authPassword.key));
    });
  });
}
