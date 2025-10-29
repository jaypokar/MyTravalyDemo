import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../presentation/ui/authPage/authentication_page.dart';
import '../presentation/ui/empty_page.dart';
import '../presentation/ui/handleErrorPage/handle_error_page.dart';
import '../presentation/ui/homePage/home_page.dart';
import '../presentation/ui/signupPage/signup_page.dart';
import '../presentation/ui/splashPage/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: AuthenticationRoute.page),
        AutoRoute(page: HandleErrorRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: HomeRoute.page),
        RedirectRoute(path: "*", redirectTo: "/"),
      ];
}
