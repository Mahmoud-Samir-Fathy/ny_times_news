import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:ny_times/core/api/status_code.dart';
import '../error/exceptions.dart';
import 'api_consumer.dart';
import 'app_interceptor.dart';
import 'endpoints.dart';
import 'package:ny_times/injection_container.dart'as di;


class DioConsumer implements ApiConsumer{
  final Dio client;

  DioConsumer({required this.client}) {
    client.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final httpClient = HttpClient();
          httpClient.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return httpClient;
        });

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    client.interceptors.add(di.getIt<AppInterceptor>());
    if(kDebugMode){
      client.interceptors.add(di.getIt<LogInterceptor>());

    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async{
    try{
      final response= await client.get(path,queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioException catch(error){
      _handleDioError(error);
    }

  }


  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  void _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();

      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badResponse:
            throw const BadRequestException();
          case StatusCode.unAuthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
          default:
            throw const FetchDataException(); // Handles unexpected status codes
        }

      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
    }
  }


}