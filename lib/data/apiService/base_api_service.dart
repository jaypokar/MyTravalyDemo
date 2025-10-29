import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/failure.dart';
import '../../resources/value_key_resources.dart';
import 'network_api_service.dart';

abstract class BaseAPIService {
  Future<Either<Failure, dynamic>> executeAPI({
    required String url,
    required Map<String, dynamic> queryParameters,
    FormData? formData,
    required ApiType apiType,
    bool isGoogleComputeAPI = false,
    String googleComputeHeaderField = ValueKeyResources.distanceInMeters,
    bool runInBackground = true,
  });

  Future<void> initiateLogoutProcess();
}
