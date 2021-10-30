import 'package:freezed_annotation/freezed_annotation.dart';

part 'Chat.freezed.dart';
part 'Chat.g.dart';

@freezed
class Chat with _$Chat{
  factory Chat({
    required String userId,
    required String matchingId,
    required String message,
    required bool isManager,
    required DateTime createDate
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

}