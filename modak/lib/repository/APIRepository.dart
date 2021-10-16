

import 'package:dio/dio.dart';
import 'package:modak/rest/RequestPostUser.dart';
import 'package:modak/rest/ResponseGetCampings.dart';
import 'package:modak/rest/ResponseGetCampingsEnvironments.dart';
import 'package:modak/rest/ResponseGetCampingsOperationTypes.dart';
import 'package:modak/rest/ResponseGetCampingsRegions.dart';
import 'package:modak/rest/RestClient.dart';

class APIRepository {
  final Dio dio;
  final RestClient restClient;

  APIRepository({required this.dio, required this.restClient});

  Future<ResponseGetCampings?> getCampings({environmentName, operationType, regionContains, contentId}) {
    return restClient.getCampings(0, 10, environmentName, operationType, regionContains, contentId);
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

  Future<String> postUser(String email) {
    return restClient.postUser(RequestPostUser(email: email));
  }

}