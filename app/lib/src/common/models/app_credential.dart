import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_credential.freezed.dart';

@freezed
class AppCredential with _$AppCredential {
  factory AppCredential({
    required String email,
    required String password,
  }) = _AppCredential;
}
