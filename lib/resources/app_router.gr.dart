// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthenticationPage]
class AuthenticationRoute extends PageRouteInfo<void> {
  const AuthenticationRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthenticationPage();
    },
  );
}

/// generated route for
/// [EmptyPage]
class EmptyRoute extends PageRouteInfo<void> {
  const EmptyRoute({List<PageRouteInfo>? children})
      : super(
          EmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmptyPage();
    },
  );
}

/// generated route for
/// [HandleErrorPage]
class HandleErrorRoute extends PageRouteInfo<HandleErrorRouteArgs> {
  HandleErrorRoute({
    required int errorCode,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HandleErrorRoute.name,
          args: HandleErrorRouteArgs(
            errorCode: errorCode,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HandleErrorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HandleErrorRouteArgs>();
      return HandleErrorPage(
        errorCode: args.errorCode,
        key: args.key,
      );
    },
  );
}

class HandleErrorRouteArgs {
  const HandleErrorRouteArgs({
    required this.errorCode,
    this.key,
  });

  final int errorCode;

  final Key? key;

  @override
  String toString() {
    return 'HandleErrorRouteArgs{errorCode: $errorCode, key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [SignupPage]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignupPage();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
