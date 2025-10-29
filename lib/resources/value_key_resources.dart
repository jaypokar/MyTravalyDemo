class ValueKeyResources {
  /// App theme
  static const String darkTheme = 'dark';
  static const String lightTheme = 'light';
  static const String deviceTheme = 'default';

  ///API Execution Keys
  static const String apiURL = 'apiURL';
  static const String queryParameters = 'queryParameters';
  static const String apiType = 'apiType';
  static const String isTokenNeeded = 'isTokenNeeded';
  static const String responseCompleter = 'responseCompleter';
  static const String response = 'response';
  static const String token = 'token';
  static const String completerKey = 'completerKey';
  static const String responseHandlerKey = 'responseHandlerKey';
  static const String notificationPermisionPrompt = 'showPrompt';

  ///Api Methods
  static const String getAPIMethod = 'GET';
  static const String getWithJSONAPIMethod = 'GET_WITH_JSON';
  static const String postAPIMethod = 'POST';
  static const String postFormDataAPIMethod = 'POST_FORM_DATA';
  static const String putAPIMethod = 'PUT';
  static const String deleteAPIMethod = 'DELETE';
  static const String patchAPIMethod = 'PATCH';
  static const String patchWithJsonAPIMethod = 'PATCH_WITH_JSON';

  ///Payment Gateway
  static const String razorpayPaymentGateway = 'razorpay';
  static const String phonePePaymentGateway = 'phonepe';

  ///AppExceptions Keys
  static const String noFirebaseToken = 'NO_FIREBASE_TOKEN';
  static const String addressSelectionServiceNotAvailable = "We dont't serve here at the moment!!";

  ///Notifications data keys
  static const String clickActionKey = 'clickAction';
  static const String relationTypeKey = 'relationType';
  static const String relationIDKey = 'relationID';

  ///payment mode conditions
  static const String cashPaymentMode = 'cash';
  static const String onlinePaymentMode = 'online';
  static const String creditPaymentMode = 'credit';
  static const String creditCashPaymentMode = 'creditCash';
  static const String creditOnlinePaymentMode = 'creditOnline';

  ///rupee symbol
  static const String rupee = "\u{20B9}";

  ///RespectiveError codes
  static const int unExpectedErrorCode = 101;
  static const int noInternetErrorCode = 110;
  static const int previousDueRemaining = 111;
  static const int driverRatingErrorCode = 112;
  static const int googleComputeRoutesDistanceErrorCode = 113;
  static const int connectionTimedOutErrorCode = -1;
  static const int unAuthenticatedUserStatusCode = 401;
  static const int forbiddenStatusCode = 403;

  ///transactions type
  static const String debit = 'debit';
  static const String credit = 'credit';

  ///Phone Pe transactions status
  static const String phonePePaymentSuccess = 'PAYMENT_SUCCESS';
  static const String phonePePaymentInitiated = 'PAYMENT_INITIATED';
  static const String phonePePaymentPending = 'PAYMENT_PENDING';
  static const String phonePePaymentInternalServerError = 'INTERNAL_SERVER_ERROR';
  static const String phonePePaymentError = 'PAYMENT_ERROR';

  ///Google Compute Routes API Header Fields
  static const String distanceInMeters = 'routes.distanceMeters';
  static const String encodedPolyLines = 'routes.polyline.encodedPolyline';
  static const String durationInSeconds = 'routes.duration';

  ///Edit or Delete key for updating address
  static const String none = 'none';
  static const String edit = 'edit';
  static const String delete = 'delete';
  static const String markAsFavourite = 'markAsFavourite';
  static const String addLocationToServer = 'addLocationToServer';

  ///Widget key names
  static const String mobileNumberTextFieldKey = 'MobileNumberTextField';
  static const String otpTextFieldKey = 'OTPTextField';
  static const String contactNameTextFieldKey = 'ContactNameTextFieldKey';
  static const String contactNumberTextFieldKey = 'ContactNumberTextFieldKey';
}
