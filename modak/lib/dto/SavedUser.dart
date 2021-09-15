import 'package:freezed_annotation/freezed_annotation.dart';

part 'SavedUser.freezed.dart';
part 'SavedUser.g.dart';

@freezed
class SavedUser with _$SavedUser{
  factory SavedUser({
    required String email,
    required String password,
  }) = _SavedUser;

  factory SavedUser.fromJson(Map<String, dynamic> json) => _$SavedUserFromJson(json);
}