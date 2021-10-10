import 'package:freezed_annotation/freezed_annotation.dart';

part 'Matching.freezed.dart';
part 'Matching.g.dart';

@freezed
class Matching with _$Matching{
  factory Matching({
    String? user,
    required int campingId,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createDate,
  }) = _Matching;

  factory Matching.fromJson(Map<String, dynamic> json) => _$MatchingFromJson(json);

}