import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/logger.dart';
import '../data/sessionManager/session_manager.dart';
import '../injection_container.dart';
import '../util/common_functions.dart';
import 'color_constants.dart';
import 'value_key_resources.dart';

class AppTheme {
  final SessionManager _sessionManager;
  static const _nunitoStyle = 'Nunito';

  static const _appFontStyle = _nunitoStyle;

  AppTheme(this._sessionManager);

  void setInitialTheme() async {
    if (_sessionManager.getAppThemeMode() == ValueKeyResources.deviceTheme) {
      _sessionManager.setAppThemeMode(ValueKeyResources.deviceTheme);
      final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      logger.i(brightness);
      await _sessionManager.setAppTheme(
        brightness == Brightness.light ? ValueKeyResources.lightTheme : ValueKeyResources.darkTheme,
      );
    }

    if (_sessionManager.getAppTheme() == ValueKeyResources.lightTheme) {
      setLightTheme();
    } else {
      setDarkTheme();
    }

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

  bool isDarkTheme() => _sessionManager.getAppTheme() == ValueKeyResources.darkTheme;

  Future<void> changeTheme(String theme) async {
    if (theme == ValueKeyResources.lightTheme) {
      await _sessionManager.setAppThemeMode(ValueKeyResources.lightTheme);
      await _sessionManager.setAppTheme(ValueKeyResources.lightTheme);
      setLightTheme();
    } else if (theme == ValueKeyResources.darkTheme) {
      await _sessionManager.setAppThemeMode(ValueKeyResources.darkTheme);
      await _sessionManager.setAppTheme(ValueKeyResources.darkTheme);
      setDarkTheme();
    } else {
      await _sessionManager.setAppThemeMode(ValueKeyResources.deviceTheme);
      await setDefaultTheme();
    }
  }

  ThemeMode getAppThemeMode() {
    if (_sessionManager.getAppThemeMode() == ValueKeyResources.deviceTheme) {
      return ThemeMode.system;
    } else if (_sessionManager.getAppThemeMode() == ValueKeyResources.lightTheme) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  String getSavedThemeMode() {
    return _sessionManager.getAppThemeMode();
  }

  String getDefaultThemeMode() {
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.light ? ValueKeyResources.lightTheme : ValueKeyResources.darkTheme;
  }

  Future<void> setDefaultTheme() async {
    final defaultTheme = getDefaultThemeMode();
    await _sessionManager.setAppTheme(defaultTheme);
    if (defaultTheme == ValueKeyResources.lightTheme) {
      setLightTheme();
    } else {
      setDarkTheme();
    }
  }

  void setLightTheme() {
    logger.i('set light theme');
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstants.transparent,
        systemStatusBarContrastEnforced: false,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark, // For iOS (dark icons)
      ),
    );
  }

  void setDarkTheme() {
    logger.i('set dark theme');
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstants.transparent,
        systemStatusBarContrastEnforced: true,
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Platform.isIOS ? Brightness.dark : Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  ThemeData getLightTheme() {
    return _setThemeData(
      lightOrDark: Brightness.light,
      scaffoldBackgroundColor: ColorConstants.lightBackground2,
      lightOrDarkStyle: SystemUiOverlayStyle.light,
      unSelectedWidgetColor: Colors.black45,
      focusColor: Colors.black,
      dividerColor: ColorConstants.borderColor1,
    );
  }

  ThemeData getDarkTheme() {
    return _setThemeData(
      lightOrDark: Brightness.dark,
      scaffoldBackgroundColor: ColorConstants.darkBackground1,
      lightOrDarkStyle: SystemUiOverlayStyle.dark,
      unSelectedWidgetColor: Colors.white54,
      focusColor: Colors.white,
      dividerColor: ColorConstants.textColor2,
    );
  }

  ThemeData _setThemeData({
    required Brightness lightOrDark,
    required Color scaffoldBackgroundColor,
    required SystemUiOverlayStyle lightOrDarkStyle,
    required Color unSelectedWidgetColor,
    required Color focusColor,
    required Color dividerColor,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.appColor, brightness: lightOrDark),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorConstants.appColor,
        selectionHandleColor: ColorConstants.appColor,
        selectionColor: ColorConstants.appColor,
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      disabledColor: Colors.black,
      appBarTheme: AppBarTheme(systemOverlayStyle: lightOrDarkStyle, centerTitle: true),
      fontFamily: _appFontStyle,
      primaryColor: ColorConstants.appColor,
      primarySwatch: sl<CommonFunctions>().createMaterialColor(ColorConstants.appColor),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorConstants.lightColorPrimary),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorConstants.lightColorPrimary),
        ),
      ),
      dividerTheme: DividerThemeData(color: dividerColor, thickness: 0.5),
      primaryColorDark: ColorConstants.appColor,
      primaryColorLight: ColorConstants.appColor,
      unselectedWidgetColor: unSelectedWidgetColor,
      focusColor: focusColor,
    );
  }
}
