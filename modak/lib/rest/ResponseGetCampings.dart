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
  String? name;
  int? viewCount;
  String? addr;
  String? phoneNumber;
  String? type;
  String? operationSeasons;
  String? operationDays;
  String? reservationWay;
  String? nearbyFacilitiesAvailable;
  String? facilities;
  String? longitude;
  String? latitude;
  String? operationType;
  String? shortDescription;
  String? longDescription;
  List<Environment>? environments;
  List<CampingImage>? campingImages;

  Content({
    required this.contentId,
    this.name,
    this.viewCount,
    this.addr,
    this.phoneNumber,
    this.type,
    this.operationSeasons,
    this.operationDays,
    this.reservationWay,
    this.nearbyFacilitiesAvailable,
    this.facilities,
    this.longitude,
    this.latitude,
    this.operationType,
    this.shortDescription,
    this.longDescription,
    this.environments,
    this.campingImages,
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