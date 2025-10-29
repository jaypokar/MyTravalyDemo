import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mytravaly/resources/config_file.dart';

import '../../core/failure.dart';
import '../../core/logger.dart';
import '../../resources/string_resources.dart';
import '../../resources/value_key_resources.dart';
import '../sessionManager/session_manager.dart';
import 'base_api_service.dart';

// ignore: constant_identifier_names
enum ApiType { GET, GET_WITH_JSON, POST, PUT, DELETE, PATCH }

class NetworkAPIService implements BaseAPIService {
  final Dio _dio;
  final InternetConnection _connectionChecker;
  final SessionManager _sessionManager;

  NetworkAPIService(this._dio, this._connectionChecker, this._sessionManager);

  @override
  Future<void> initiateLogoutProcess() async {
    await _sessionManager.initiateLogout();
  }

  @override
  Future<Either<Failure, dynamic>> executeAPI({
    required String url,
    required Map<String, dynamic> queryParameters,
    FormData? formData,
    required ApiType apiType,
    bool isGoogleComputeAPI = false,
    String googleComputeHeaderField = ValueKeyResources.distanceInMeters,
    bool runInBackground = true,
  }) async {
    // Create a json web token

    bool result = await _connectionChecker.hasInternetAccess;
    if (result) {
      try {
        late Response response;

        final Options headerOptions = await _getHeaderOptions(
          isGoogleComputeAPI,
          googleComputeHeaderField,
        );

        if (apiType == ApiType.GET) {
          response = queryParameters.isEmpty
              ? await _dio.get(url, options: headerOptions)
              : await _dio.get(url, queryParameters: queryParameters, options: headerOptions);
        } else if (apiType == ApiType.GET_WITH_JSON) {
          response = await _dio.get(url, data: queryParameters, options: headerOptions);
        } else if (apiType == ApiType.POST) {
          response = await _dio.post(url, data: queryParameters, options: headerOptions);
        } else if (apiType == ApiType.PUT) {
          response = await _dio.put(url, data: queryParameters, options: headerOptions);
        } else if (apiType == ApiType.PATCH) {
          response = await _dio.patch(url, data: queryParameters, options: headerOptions);
        } else {
          response = await _dio.delete(url, data: queryParameters, options: headerOptions);
        }

        logger.d('URL : $url\n Request:  $queryParameters');
        logger.d(response.data);
        return right(response.data);
      } on DioException catch (e) {
        return await _handleDioError(e: e, url: url, queryParameters: queryParameters);
      } on SocketException catch (e) {
        logger.e(e);
        return left(
          const Failure(
            StringResources.checkInternetConnection,
            statusCode: ValueKeyResources.noInternetErrorCode,
          ),
        );
      } on TypeError catch (e) {
        logger.e(e);
        return left(
          Failure(
            '${StringResources.responseTypeError} - ${e.toString()}',
            statusCode: ValueKeyResources.unExpectedErrorCode,
          ),
        );
      } on Exception catch (e) {
        logger.e(e);
        return left(
          Failure(
            '${StringResources.responseTypeError} - ${e.toString()}',
            statusCode: ValueKeyResources.unExpectedErrorCode,
          ),
        );
      }
    } else {
      return left(
        const Failure(
          StringResources.checkInternetConnection,
          statusCode: ValueKeyResources.noInternetErrorCode,
        ),
      );
    }
  }

  Future<Either<Failure, dynamic>> _handleDioError({
    required DioException e,
    required String url,
    required Map<String, dynamic> queryParameters,
  }) async {
    String message = '';
    int errorCode = ValueKeyResources.unExpectedErrorCode;
    if (e.type == DioExceptionType.connectionTimeout) {
      message = StringResources.connectionTimedOut;
      errorCode = ValueKeyResources.connectionTimedOutErrorCode;
    } else if (e.type == DioExceptionType.connectionError) {
      message = StringResources.unexpectedErrorOccurred;
      errorCode = ValueKeyResources.unExpectedErrorCode;
    } else if (e.response != null) {
      if (e.response!.statusCode == ValueKeyResources.unAuthenticatedUserStatusCode ||
          e.response!.statusCode == ValueKeyResources.forbiddenStatusCode) {
        await initiateLogoutProcess();
      }
      try {
        message = e.response!.data['message'].toString();
      } catch (e) {
        logger.e(e);
        message = e.toString();
      }

      errorCode = e.response!.statusCode ?? ValueKeyResources.noInternetErrorCode;
      logger.e(
        'URL : $url'
        '\nRequest:  $queryParameters'
        '\nthe error message : $message'
        '\nthe error response :${e.response}'
        '\nStatus Code : $errorCode',
      );
    }
    if (message.isEmpty) {
      message = StringResources.errorTitle;
    }
    return left(Failure(message, statusCode: errorCode));
  }

  Future<Options> _getHeaderOptions(bool isGoogleComputeAPI, String googleComputeHeaderField) async {
    return Options(
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {"authtoken": ConfigFile.authToken, 'visitortoken': ConfigFile.visitorToken},
    );
  }
}
