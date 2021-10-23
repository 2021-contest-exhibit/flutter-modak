import 'package:modak/rest/FindCampingsRequestDto.dart';
import 'package:modak/rest/RequestDeleteGood.dart';
import 'package:modak/rest/RequestPostUser.dart';
import 'package:modak/rest/ResponseGetCampings.dart';
import 'package:modak/rest/ResponseGetCampingsEnvironments.dart';
import 'package:modak/rest/ResponseGetCampingsOperationTypes.dart';
import 'package:modak/rest/ResponseGetCampingsRegions.dart';
import 'package:modak/rest/ResponseGetUser.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import 'RequestPostGood.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "http://192.168.0.100:8080/modak")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/campings")
  Future<ResponseGetCampings> getCampings(
      @Query("page") int page,
      @Query("size") int size,
      @Query("environmentName") String environmentName,
      @Query("operationType") String operationType,
      @Query("regionContains") String regionContains,
      @Query("contentId") int contentId,
      @Query("email") String email,
      @Query("nameContains") String nameContains);

  @POST("/find-campings")
  Future<ResponseGetCampings> findCampings(
      @Query("page") int page,
      @Query("size") int size,
      @Query("email") String email,
      @Body() FindCampingsRequestDto findCampingsRequestDto);

  @GET("/campings/regions")
  Future<ResponseGetCampingsRegions> getCampingsRegions();

  @GET("/campings/environments")
  Future<ResponseGetCampingsEnvironments> getCampingsEnvironments();

  @GET("/campings/operation-types")
  Future<ResponseGetCampingsOperationTypes> getCampingsOperationTypes();

  @POST("/user")
  Future<String> postUser(@Body() RequestPostUser user);

  @GET("/user")
  Future<ResponseGetUser> getUser(@Query("email") String email);

  @POST("/good")
  Future<String> postGood(@Body() RequestPostGood requestPostGood);

  @DELETE("/good")
  Future<String> deleteGood(@Body() RequestDeleteGood requestDeleteGood);

  @GET("/campings/recommendation/good")
  Future<ResponseGetCampings> postCampingsRecommendationGood(@Query("email") String email, @Query("page") int page, @Query("size") int size);

  @GET("/campings/recommendation/ai")
  Future<ResponseGetCampings> postCampingsRecommendationAI(@Query("email") String email, @Query("page") int page, @Query("size") int size);
}
