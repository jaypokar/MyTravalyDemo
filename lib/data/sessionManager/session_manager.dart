import 'dart:convert';

import 'package:mytravaly/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/value_key_resources.dart';

class SessionManager {
  final SharedPreferences _preferences;
  UserModel? _loginData;

  /*Session value keys*/
  final String userDataKey = 'user_data';
  final String isLoggedInKey = 'is_logged_in';
  final String isUserFirstTimeInKey = 'is_userFirstTime_in';
  final String isVerificationPopupDisplayed = 'is_verification_popup_displayed';
  final String language = 'language';
  final String userCurrentLocation = 'userCurrentLocation';
  final String firebaseToken = 'firebaseToken';
  final String appLastAccessDate = 'appLastAccessDate';
  final String cityFetchedAccessDate = 'cityFetchedAccessDate';
  final String zoneAndClustersFetchedAccessDate = 'zoneAndClustersFetchedAccessDate';
  final String contactsFetchedAccessDate = 'contactsFetchedAccessDate';
  final String savedPaymentPreference = 'savedPaymentPreference';
  final String initialAppRating = 'initialAppRating';
  final String isPromotionalImageShownForCurrentDate = 'isPromotionalImageShownForCurrentDate';
  final String initialAppOpenedDate = 'initialAppOpenedDate';
  final String localAddressPageStored = 'localAddressPageStored';
  final String generalContactNo = 'generalContactNo';
  final String twoWheelerContactNo = 'twoWheelerContactNo';
  final String threeWheelerContactNo = 'threeWheelerContactNo';
  final String fourWheelerContactNo = 'fourWheelerContactNo';
  final String cityID = 'cityID';
  final String appTheme = 'appTheme';
  final String appThemeMode = 'appThemeMode';
  final String introScreenDisplayed = 'introScreenDisplayed';
  final String cityChangeShowcaseShowned = 'cityChangeShowcaseShowned';

  SessionManager(this._preferences);

  Future<void> initiateUserLogin(UserModel loginDetails) async {
    final String userDetails = json.encode(loginDetails.toMap());
    _loginData = loginDetails;
    _preferences.setString(userDataKey, userDetails);
    _preferences.setBool(isLoggedInKey, true);
  }

  UserModel? _getUserDetails() {
    if (_preferences.containsKey(userDataKey)) {
      final String value = _preferences.getString(userDataKey) ?? '';
      final Map<String, dynamic> userDetails = json.decode(value) as Map<String, dynamic>;
      _loginData = UserModel.fromMap(userDetails);
    }
    return _loginData;
  }

  bool isUserLoggedIn() => _preferences.getBool(isLoggedInKey) ?? false;

  String userName() => _getUserDetails() != null ? _getUserDetails()?.username ?? 'User' : 'User';

  ///manage App Theme
  Future<void> setAppThemeMode(String mode) async {
    await _preferences.setString(appThemeMode, mode);
  }

  String getAppThemeMode() => _preferences.getString(appThemeMode) ?? ValueKeyResources.deviceTheme;

  Future<void> setAppTheme(String theme) async {
    await _preferences.setString(appTheme, theme);
  }

  String? getAppTheme() => _preferences.getString(appTheme);

  Future<void> initiateLogout() async {
    _loginData = null;
    await _preferences.clear();
    await _preferences.setBool(isLoggedInKey, false);
  }
}
