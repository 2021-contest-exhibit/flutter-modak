

import 'package:dio/dio.dart';
import 'package:modak/rest/ResponseGetCampings.dart';
import 'package:modak/rest/RestClient.dart';

class APIRepository {
  final Dio dio;
  final RestClient restClient;

  APIRepository({required this.dio, required this.restClient});

  Future<ResponseGetCampings?> getCampings({environmentName, operationType, regionContains}) {
    return restClient.getCampings(0, 10, environmentName, operationType, regionContains);
  }
}