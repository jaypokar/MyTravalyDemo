import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mytravaly/data/repositoryImpl/auth_repository_impl.dart';
import 'package:mytravaly/data/repositoryImpl/home_repository_impl.dart';
import 'package:mytravaly/domain/auth_repository.dart';
import 'package:mytravaly/domain/home_repository.dart';
import 'package:mytravaly/domain/profile_repository.dart';
import 'package:mytravaly/presentation/bloc/authBloc/auth_bloc.dart';
import 'package:mytravaly/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:mytravaly/presentation/bloc/profileBloc/profile_bloc.dart';
import 'package:mytravaly/presentation/cubit/appThemeCubit/app_theme_cubit.dart';
import 'package:mytravaly/resources/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/apiService/base_api_service.dart';
import 'data/apiService/network_api_service.dart';
import 'data/repositoryImpl/profile_repository_impl.dart';
import 'data/sessionManager/session_manager.dart';
import 'firebase_options.dart';
import 'navigationArgs/navigation_observer.dart';
import 'resources/app_router.dart';
import 'util/common_functions.dart';

final GetIt sl = GetIt.instance;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> init() async {
  ///Initialize all needed Dependencies here so that we can avoid unnecessary object creation from all
  ///over the project and the object can be injected through here at any place

  ///Firebase setup
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// global http override settings
  HttpOverrides.global = MyHttpOverrides();

  ///! External /* All the other required external injection are embedded here */
  await _initExternalDependencies();

  /// Repository /* All the repository injection are embedded here */
  await _initRepositories();

  /// Bloc /* All the bloc injection are embedded here */
  await _initBlocs();

  /// cubit inject for small and effective ui updates
  await _initCubits();
}

Future<void> _initBlocs() async {
  //Add Blocs

  ///Create Authentication Bloc
  sl.registerFactory(() => AuthBloc(sl()));

  ///Create Profile Bloc
  sl.registerFactory(() => ProfileBloc(sl()));

  ///Create Home Bloc
  sl.registerFactory(() => HomeBloc(sl()));
}

Future<void> _initCubits() async {
  //Add Cubits.

  sl.registerFactory(() => AppThemeCubit(sl()));
}

Future<void> _initRepositories() async {
  ///Base Api Services Repository
  sl.registerLazySingleton<BaseAPIService>(() => NetworkAPIService(sl(), sl(), sl()));

  ///Authentication Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl(), sl()));

  ///Profile Repository
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(sl(), sl()));

  ///Home Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
}

Future<void> _initExternalDependencies() async {
  final Dio dio = Dio(
    BaseOptions(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      receiveDataWhenStatusError: true,
    ),
  );

  (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  };
  sl.registerLazySingleton(() => dio);

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => GoogleSignIn());
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => NavigationObserver());
  sl.registerLazySingleton(() => InternetConnection.createInstance());
  sl.registerLazySingleton(() => SessionManager(sl()));
  sl.registerLazySingleton(() => CommonFunctions());
  sl.registerLazySingleton(() => AppRouter());
  sl.registerLazySingleton(() => AppTheme(sl()));
}
