import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modak/rest/Content.dart';

part 'Matching.freezed.dart';
part 'Matching.g.dart';

@freezed
class Matching with _$Matching{
  factory Matching({
    required String? user,
    required int campingId,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createDate,
    required List<String>? userList
  }) = _Matching;

  factory Matching.fromJson(Map<String, dynamic> json) => _$MatchingFromJson(json);

}