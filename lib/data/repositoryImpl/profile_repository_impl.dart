import 'package:dartz/dartz.dart';
import 'package:mytravaly/core/either_extension_function.dart';

import '../../core/app_type_def.dart';
import '../../core/failure.dart';
import '../../core/update_ui_mixin.dart';
import '../../domain/profile_repository.dart';
import '../apiService/base_api_service.dart';
import '../apiService/network_api_service.dart';
import '../sessionManager/session_manager.dart';

class ProfileRepositoryImpl with UpdateUiMixin implements ProfileRepository {
  final BaseAPIService _baseAPIService;
  final SessionManager _sessionManager;

  ProfileRepositoryImpl(this._baseAPIService, this._sessionManager);

  @override
  Future<Either<Failure, Unit>> verifyEmail({required String email}) {
    return backToUI<Unit>(
      () => _baseAPIService.executeAPI(
        url: '',
        queryParameters: {'emailAddress': email},
        apiType: ApiType.PATCH,
      ),
      flag: 'emailVerification',
    );
  }

  @override
  void initiateLogoutProcess() => _baseAPIService.initiateLogoutProcess();

  @override
  Future<Either<Failure, T>> backToUI<T>(ManageAPIResponse manageAPIResponse, {String flag = ''}) async {
    final Either<Failure, dynamic> possibleData = await manageAPIResponse();

    if (possibleData.isLeft()) {
      return left(
        Failure(possibleData.getLeft()!.error, statusCode: possibleData.getLeft()!.statusCode),
      );
    }
    final response = possibleData.getRight();
    late final T data;
    if (T == Unit && flag == 'emailVerification') {
      data = unit as T;
    }
    return right(data);
  }

  @override
  bool checkIfUserLoggedIn() => _sessionManager.isUserLoggedIn();
}
