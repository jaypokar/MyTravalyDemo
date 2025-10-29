import 'package:dartz/dartz.dart';

import '../core/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signInWithGoogle();

  Future<Either<Failure, Unit>> signInWithEmailPassword(
      {required String email, required String password});

  Future<Either<Failure, Unit>> signUpWithEmailPassword(
      {required String userName, required String email, required String password});
}
