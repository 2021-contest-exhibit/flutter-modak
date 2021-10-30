

import 'package:dio/dio.dart';
import 'package:modak/rest/FindCampingsRequestDto.dart';
import 'package:modak/rest/RequestDeleteGood.dart';
import 'package:modak/rest/RequestPostGood.dart';
import 'package:modak/rest/RequestPostUser.dart';
import 'package:modak/rest/ResponseGetCampings.dart';
import 'package:modak/rest/ResponseGetCampingsEnvironments.dart';
import 'package:modak/rest/ResponseGetCampingsFacilities.dart';
import 'package:modak/rest/ResponseGetCampingsOperationTypes.dart';
import 'package:modak/rest/ResponseGetCampingsRegions.dart';
import 'package:modak/rest/ResponseGetUser.dart';
import 'package:modak/rest/RestClient.dart';

class APIRepository {
  final Dio dio;
  final RestClient restClient;

  APIRepository({required this.dio, required this.restClient});

  Future<ResponseGetCampings?> getCampings({environmentName, operationType, regionContains, contentId, email, nameContains}) {
    return restClient.getCampings(
        0,
        10,
        environmentName,
        operationType,
        regionContains,
        contentId,
        email,
        nameContains);
  }

  Future<ResponseGetCampings?> findCampingsByList({email, operationTypeEqual, regionContains, environmentEqual, nameContains, facilityEqual}) {
    return restClient.findCampings(
      0,
      10,
      email,
      FindCampingsRequestDto(operationTypeEqual: operationTypeEqual, regionContains: regionContains, environmentEqual: environmentEqual, nameContains: nameContains, facilityEqual:facilityEqual)
    );
  }

  Future<ResponseGetCampings?> getTodayCampings(String email, int page, int size) {
    return restClient.postCampingsRecommendationGood(email, page, size);
  }

  Future<ResponseGetCampings?> getRecommandCampings(String email, int page, int size) {
    return restClient.postCampingsRecommendationGood(email, page, size);
  }

  Future<ResponseGetCampings?> getRecommandAICampings(String email) {
    return restClient.postCampingsRecommendationAI(email, 0, 5);
  }

  Future<ResponseGetCampingsRegions?> getCampingsRegions() {
    return restClient.getCampingsRegions();
  }

  Future<ResponseGetCampingsOperationTypes?> getCampingsOperationTypes() {
    return restClient.getCampingsOperationTypes();
  }

  Future<ResponseGetCampingsEnvironments?> getCampingsEnvironments() {
    return restClient.getCampingsEnvironments();
  }

  Future<ResponseGetCampingsFacilities?> getCampingsFacilities() {
    return restClient.getCampingsFacilities();
  }


  Future<String> postUser(String email) {
    return restClient.postUser(RequestPostUser(email: email));
  }

  Future<ResponseGetUser> getUserFavorite(String email) {
    return restClient.getUser(email);
  }

  Future<String> getGoods(int contentId, String email) {
    return restClient.postGood(RequestPostGood(contentId: contentId, email: email));
  }

  Future<String?> deleteGoods(int contentId, String email) {
    return restClient.deleteGood(RequestDeleteGood(contentId: contentId, email: email));
  }
}