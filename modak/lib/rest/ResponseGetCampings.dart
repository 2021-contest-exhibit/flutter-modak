import 'package:freezed_annotation/freezed_annotation.dart';

part 'ResponseGetCampings.g.dart';

@JsonSerializable()
class ResponseGetCampings {
  List<Content> content;

  ResponseGetCampings({required this.content});

  factory ResponseGetCampings.fromJson(Map<String, dynamic> json) => _$ResponseGetCampingsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetCampingsToJson(this);
}

@JsonSerializable()
class Content {
  int contentId;
  String name;
  int viewCount;
  String addr;
  String phoneNumber;
  String type;
  String operationSeasons;
  String operationDays;
  String reservationWay;
  String nearbyFacilitiesAvailable;
  String facilities;
  String longitude;
  String latitude;
  String operationType;
  List<Environment> environments;
  List<CampingImage> campingImages;

  Content({
    required this.contentId,
    required this.name,
    required this.viewCount,
    required this.addr,
    required this.phoneNumber,
    required this.type,
    required this.operationSeasons,
    required this.operationDays,
    required this.reservationWay,
    required this.nearbyFacilitiesAvailable,
    required this.facilities,
    required this.longitude,
    required this.latitude,
    required this.operationType,
    required this.environments,
    required this.campingImages,
  });

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class Environment {
  int id;
  String name;

  Environment({required this.id, required this.name});

  factory Environment.fromJson(Map<String, dynamic> json) => _$EnvironmentFromJson(json);

  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);
}

@JsonSerializable()
class CampingImage {
  int id;
  String serialnum;
  String modifiedtime;
  String imageUrl;

  CampingImage({required this.id, required this.serialnum, required this.modifiedtime, required this.imageUrl});

  factory CampingImage.fromJson(Map<String, dynamic> json) => _$CampingImageFromJson(json);

  Map<String, dynamic> toJson() => _$CampingImageToJson(this);
}