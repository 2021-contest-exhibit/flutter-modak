import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

part 'Matching.freezed.dart';
part 'Matching.g.dart';

@freezed
class Matching with _$Matching{
  factory Matching({
    String? user,
    String? email,
    required int campingId,
    Content? content,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createDate,
  }) = _Matching;

  factory Matching.fromJson(Map<String, dynamic> json) => _$MatchingFromJson(json);

}