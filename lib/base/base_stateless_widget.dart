import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../injection_container.dart';
import '../resources/app_router.dart';
import '../resources/color_constants.dart';
import '../util/common_functions.dart';
import 'base_view.dart';

abstract class BaseStatelessWidgetState extends StatelessWidget implements BaseView {
  const BaseStatelessWidgetState({super.key});

  @override
  void onError(String errorMessageKey) {}

  Future<dynamic> push(PageRouteInfo<dynamic> widget) {
    return sl<AppRouter>().push(widget);
  }

  Future<dynamic> pushReplacement(PageRouteInfo<dynamic> widget, {BuildContext? context}) {
    return sl<AppRouter>().replace(widget);
  }

  Future<dynamic> pushAndClearStack(PageRouteInfo<dynamic> widget, context) {
    return sl<AppRouter>().pushAndPopUntil(widget, predicate: (Route<dynamic> route) => route.isFirst);
  }

  Future<dynamic> pop([dynamic result]) {
    if (isDashBoardRouteActive()) {
      return sl<AppRouter>().maybePop(result);
    } else {
      return pushReplacement(
        const AuthenticationRoute(),
      );
    }

    //return sl<AppRouter>().pop(result);
  }

  bool isDashBoardRouteActive() => sl<AppRouter>().navigationHistory.canNavigateBack;

  bool isRouteActive(String routeName) => sl<AppRouter>().navigationHistory.isRouteActive(routeName);

  void popUntil(String routeName) {
    sl<AppRouter>().popUntilRouteWithName(routeName);
  }

  void removeWhere(String routeName) {
    sl<AppRouter>().removeWhere((RouteData route) => route.name == routeName);
  }

  void showFlushBarValidationMessage(
    String message,
    BuildContext context, {
    int duration = 2,
    Color bgColor = ColorConstants.pendingColor,
  }) {
    sl<CommonFunctions>().showFlushBar(
      context: context,
      message: message,
      bgColor: bgColor,
      duration: duration,
      textColor: Colors.white,
    );
  }

  void showValidationMessage(String message, BuildContext context) {
    sl<CommonFunctions>().showSnackBar(
      context: context,
      message: message,
      bgColor: ColorConstants.errorBgColor,
      textColor: Colors.white,
    );
  }

  void showSuccessMessage(String message, BuildContext context) {
    sl<CommonFunctions>().showSnackBar(
      context: context,
      message: message,
      bgColor: ColorConstants.appColor,
      textColor: Colors.white,
    );
  }

  Future<dynamic> handleErrorCodes({required int errorCode}) async =>
      await push(HandleErrorRoute(errorCode: errorCode));

  @override
  void hideProgress(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  void showProgress(BuildContext ctx) {}

  @override
  void showError(String errorMessage, Color color, ScaffoldState state) {}

  bool isDarkTheme(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
}
