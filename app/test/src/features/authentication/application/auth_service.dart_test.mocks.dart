// Mocks generated by Mockito 5.3.0 from annotations
// in owly/test/src/features/authentication/application/auth_service.dart_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:nhost_sdk/nhost_sdk.dart' as _i2;
import 'package:owly/src/common/models/app_credential.dart' as _i3;
import 'package:owly/src/features/authentication/data/local_auth_repository.dart'
    as _i6;
import 'package:owly/src/features/authentication/data/remote_auth_repository.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuthResponse_0 extends _i1.SmartFake implements _i2.AuthResponse {
  _FakeAuthResponse_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeAppCredential_1 extends _i1.SmartFake implements _i3.AppCredential {
  _FakeAppCredential_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [RemoteAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteAuthRepository extends _i1.Mock
    implements _i4.RemoteAuthRepository {
  MockRemoteAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void Function(void Function(_i2.AuthenticationState))
      get addAuthStateChangedCallback =>
          (super.noSuchMethod(Invocation.getter(#addAuthStateChangedCallback),
                  returnValue: (void Function(_i2.AuthenticationState) __p0) {})
              as void Function(void Function(_i2.AuthenticationState)));
  @override
  _i2.AuthenticationState get authenticationState =>
      (super.noSuchMethod(Invocation.getter(#authenticationState),
              returnValue: _i2.AuthenticationState.inProgress)
          as _i2.AuthenticationState);
  @override
  _i5.Future<_i2.AuthResponse?> signInEmailPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInEmailPassword, [],
                  {#email: email, #password: password}),
              returnValue: _i5.Future<_i2.AuthResponse?>.value())
          as _i5.Future<_i2.AuthResponse?>);
  @override
  _i5.Future<_i2.AuthResponse> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: _i5.Future<_i2.AuthResponse>.value(
                  _FakeAuthResponse_0(this, Invocation.method(#signOut, []))))
          as _i5.Future<_i2.AuthResponse>);
  @override
  _i5.Future<_i2.AuthResponse> signUp(
          {String? email,
          String? password,
          String? locale,
          String? defaultRole,
          List<String>? roles,
          String? displayName,
          String? redirectTo}) =>
      (super.noSuchMethod(
          Invocation.method(#signUp, [], {
            #email: email,
            #password: password,
            #locale: locale,
            #defaultRole: defaultRole,
            #roles: roles,
            #displayName: displayName,
            #redirectTo: redirectTo
          }),
          returnValue: _i5.Future<_i2.AuthResponse>.value(_FakeAuthResponse_0(
              this,
              Invocation.method(#signUp, [], {
                #email: email,
                #password: password,
                #locale: locale,
                #defaultRole: defaultRole,
                #roles: roles,
                #displayName: displayName,
                #redirectTo: redirectTo
              })))) as _i5.Future<_i2.AuthResponse>);
  @override
  _i5.Future<void> resetPassword(String? email) => (super.noSuchMethod(
      Invocation.method(#resetPassword, [email]),
      returnValue: _i5.Future<void>.value(),
      returnValueForMissingStub: _i5.Future<void>.value()) as _i5.Future<void>);
}

/// A class which mocks [LocalAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalAuthRepository extends _i1.Mock
    implements _i6.LocalAuthRepository {
  MockLocalAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.AppCredential?> getCredential() =>
      (super.noSuchMethod(Invocation.method(#getCredential, []),
              returnValue: _i5.Future<_i3.AppCredential?>.value())
          as _i5.Future<_i3.AppCredential?>);
  @override
  _i5.Future<_i3.AppCredential> updateCredential(
          _i3.AppCredential? credential) =>
      (super.noSuchMethod(Invocation.method(#updateCredential, [credential]),
          returnValue: _i5.Future<_i3.AppCredential>.value(_FakeAppCredential_1(
              this, Invocation.method(#updateCredential, [credential])))) as _i5
          .Future<_i3.AppCredential>);
  @override
  _i5.Future<void> clearCredential() => (super.noSuchMethod(
      Invocation.method(#clearCredential, []),
      returnValue: _i5.Future<void>.value(),
      returnValueForMissingStub: _i5.Future<void>.value()) as _i5.Future<void>);
}
