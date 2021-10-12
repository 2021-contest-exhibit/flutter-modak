import 'package:freezed_annotation/freezed_annotation.dart';

part 'ModakUser.freezed.dart';
part 'ModakUser.g.dart';

@freezed
class ModakUser with _$ModakUser{
  factory ModakUser({
    required String userid,
    required int level,
  }) = _ModakUser;

  factory ModakUser.fromJson(Map<String, dynamic> json) => _$ModakUserFromJson(json);
}