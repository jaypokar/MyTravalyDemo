import 'package:dartz/dartz.dart';

import '../core/failure.dart';


abstract class ProfileRepository {
  Future<Either<Failure, Unit>> verifyEmail({required String email});

  bool checkIfUserLoggedIn();

  void initiateLogoutProcess();
}
