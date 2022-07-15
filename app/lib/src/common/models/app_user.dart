import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    required Uuid id,
    required String displayName,
    required String? email,
    required String? phoneNumber,
    required bool emailVerified,
    required String avatarUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isAnonymous,
  }) = _AppUser;
}
