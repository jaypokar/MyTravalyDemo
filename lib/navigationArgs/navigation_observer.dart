import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/logger.dart';

class NavigationObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      logger.i('New route pushed: ${route.settings.name}');
      //sl<AnalyticsRepository>().logCurrentScreen(screenName: route.settings.name ?? '');
    }
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    logger.i('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    logger.i('Tab route re-visited: ${route.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.i('The Route is poped: ${route.settings.name}');
    if (previousRoute != null) {
      if (previousRoute.settings.name != null) {}
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    logger.i('The Route is poped: ${newRoute?.settings.name}');
    if (newRoute != null) {
      if (newRoute.settings.name != null) {}
    }
  }
}
