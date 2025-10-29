import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mytravaly/resources/string_resources.dart';
import 'package:mytravaly/util/common_functions.dart';

import '../../core/failure.dart';
import '../../core/logger.dart';
import '../../domain/auth_repository.dart';
import '../../injection_container.dart';
import '../model/user_model.dart';
import '../sessionManager/session_manager.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SessionManager _sessionManager;
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(
    this._sessionManager,
    this._googleSignIn,
    this._firebaseAuth,
  );

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() async {
    try {
      /// Check if the user has google account
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return left(const Failure(StringResources.noUserFound));

      ///if user has google acc move forward with authenticating with google prompt
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      ///If user allows and select google acc from the prompt sign in with Firebase Auth to get User
      ///credentials
      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        final user = userCredential.user!;
        final userModel = UserModel(
          id: user.uid,
          email: user.email ?? '',
          username: user.displayName ?? 'User',
          photoUrl: user.photoURL,
        );

        ///save user credentials to shared preferences
        await _sessionManager.initiateUserLogin(userModel);
        return right(unit);
      }
    } catch (e) {
      return left(Failure('Google sign in failed: $e'));
    }
    return left(const Failure('Sorry! Google Sign in failed'));
  }

  @override
  Future<Either<Failure, Unit>> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      ///Sign in with email and password through firebase auth as save the credentials
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// if user exists than save data to sessions
      if (userCredential.user != null) {
        final user = userCredential.user!;

        await _sessionManager.initiateUserLogin(UserModel(
          id: user.uid,
          email: email,
          username: 'User',
          photoUrl: '',
        ));

        return right(unit);
      } else {
        /// else signup the user and move further
        return await signUpWithEmailPassword(userName: 'User', email: email, password: password);
      }
    } catch (e) {
      logger.e(e);
      return left(Failure('Google sign in failed: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signUpWithEmailPassword(
      {required String userName, required String email, required String password}) async {
    logger.i('🔄 AuthRepository - Creating user with email: $email');
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      logger.i('✅ AuthRepository - User created successfully');

      if (userCredential.user != null) {
        final user = userCredential.user!;
        logger.i('🔄 AuthRepository - Creating user model');

        await _sessionManager.initiateUserLogin(UserModel(
          id: user.uid,
          email: email,
          username: userName,
          photoUrl: '',
        ));
      } else {
        await _sessionManager.initiateUserLogin(UserModel(
          id: sl<CommonFunctions>().getRandomString(7),
          email: email,
          username: userName,
          photoUrl: '',
        ));
      }
      return right(unit);
    } on FirebaseAuthException catch (e) {
      logger.i('❌ AuthRepository - Firebase Auth Exception: ${e.code} - ${e.message}');
    } catch (e) {
      logger.i('❌ AuthRepository - General Exception: $e');

      /// Handle the specific type cast error
      if (e.toString().contains('PigeonUserDetails')) {
        logger.i('🔧 AuthRepository - Handling error, retrying...');

        ///Wait a moment and try to get the current user
        await Future.delayed(const Duration(milliseconds: 500));
        final currentUser = _firebaseAuth.currentUser;
        if (currentUser != null) {
          logger.i('✅ AuthRepository - Found current user after retry');
          await _sessionManager.initiateUserLogin(UserModel(
            id: currentUser.uid,
            email: email,
            username: userName,
          ));

          return right(unit);
        }
      }
    }
    return left(const Failure('Email sign up failed'));
  }
}
