import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../injection_container.dart';
import '../resources/app_router.dart';
import '../resources/color_constants.dart';
import '../util/common_functions.dart';
import 'base_view.dart';

abstract class BaseStatefulWidgetState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver
    implements BaseView {
  ThemeData? theme;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void onError(String errorMessageKey) {}

  Future<dynamic> push(PageRouteInfo<dynamic> widget) {
    return sl<AppRouter>().push(widget);
  }

  Future<dynamic> pushReplacement(PageRouteInfo<dynamic> widget) {
    return sl<AppRouter>().replace(widget);
  }

  Future<dynamic> pushAndClearStack(PageRouteInfo<dynamic> widget) {
    return sl<AppRouter>().pushAndPopUntil(widget, predicate: (Route<dynamic> route) => route.isFirst);
  }

  Future<dynamic> pop([dynamic result]) {
    if (isDashBoardRouteActive()) {
      return sl<AppRouter>().maybePop(result);
    } else {
      return pushReplacement(
        /*sl<SessionManager>().isUserLoggedIn() ? const DashBoardRoute() : */ const AuthenticationRoute(),
      );
    }
  }

  bool isRouteActive(String routeName) => sl<AppRouter>().navigationHistory.isRouteActive(routeName);

  bool isDashBoardRouteActive() => sl<AppRouter>().navigationHistory.canNavigateBack;

  void popUntil(String routeName) {
    sl<AppRouter>().popUntilRouteWithName(routeName);
  }

  void removeWhere(String routeName) {
    sl<AppRouter>().removeWhere((RouteData route) => route.name == routeName);
  }

  void showFlushBarValidationMessage(
    BuildContext context,
    String message, {
    int duration = 2,
    double textSize = 14,
    Color bgColor = ColorConstants.pendingColor,
  }) {
    sl<CommonFunctions>().showFlushBar(
      context: context,
      message: message,
      bgColor: bgColor,
      textSize: textSize,
      duration: duration,
      textColor: Colors.white,
    );
  }

  void showValidationMessage(String message, {int duration = 2}) {
    sl<CommonFunctions>().showSnackBar(
      context: context,
      message: message,
      bgColor: ColorConstants.errorBgColor,
      duration: duration,
      textColor: Colors.white,
    );
  }

  void showSuccessMessage(String message) {
    sl<CommonFunctions>().showSnackBar(
      context: context,
      message: message,
      bgColor: ColorConstants.appColor,
      textColor: Colors.white,
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void hideProgress(BuildContext ctx) {
    // context.loaderOverlay.hide();
    //Navigator.of(ctx).pop();
  }

  @override
  void showProgress(BuildContext ctx) {
    //context.loaderOverlay.show();
    //sl<CommonFunctions>().showLoader(ctx);
  }

  bool isDarkTheme() => Theme.of(context).brightness == Brightness.dark;

  @override
  void showError(String errorMessage, Color color, ScaffoldState state) {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state);

  Future<dynamic> handleErrorCodes({required int errorCode}) async =>
      await push(HandleErrorRoute(errorCode: errorCode));
}
