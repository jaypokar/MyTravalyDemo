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

  ///GST detail
  static const String gstActiveStatus = 'ACTIVE';

  ///Api Methods
  static const String getAPIMethod = 'GET';
  static const String getWithJSONAPIMethod = 'GET_WITH_JSON';
  static const String postAPIMethod = 'POST';
  static const String postFormDataAPIMethod = 'POST_FORM_DATA';
  static const String putAPIMethod = 'PUT';
  static const String deleteAPIMethod = 'DELETE';
  static const String patchAPIMethod = 'PATCH';
  static const String patchWithJsonAPIMethod = 'PATCH_WITH_JSON';

  ///Select Pick And Drop page type of location selection
  static const String isInitialSelection = 'isInitialSelection';
  static const String isDropInitialSelection = 'isDropInitialSelection';
  static const String isPickupUpdateFromDropSelectionScreen = 'isPickupUpdateFromDropSelectionScreen';
  static const String isPickupUpdateFromBookingConfirmScreen = 'isPickupUpdateFromBookingConfirmScreen';
  static const String isDropAddNewStopSelection = 'isDropAddNewStopSelection';
  static const String isDropUpdateFromDropSelectionScreen = 'isDropUpdateFromDropSelectionScreen';
  static const String isBookNowLocationSelectionScreen = 'isBookNowLocationSelectionScreen';
  static const String isPickUpAndDropExchangedSelectionScreen =
      'isPickUpAndDropExchangedSelectionScreen';
  static const String editOrUpdateSavedPlacesScreen = 'editOrUpdateSavedPlacesScreen';

  ///Payment Gateway
  static const String razorpayPaymentGateway = 'razorpay';
  static const String phonePePaymentGateway = 'phonepe';

  ///Saved Address Type
  static const String home = 'Home';
  static const String shop = 'Shop';
  static const String other = 'Other';

  ///AppExceptions Keys
  static const String noFirebaseToken = 'NO_FIREBASE_TOKEN';
  static const String addressSelectionServiceNotAvailable = "We dont't serve here at the moment!!";

  ///Order cancel reasons and ratings keys
  static const String reasonIDKey = 'reasonID';
  static const String additionalCommentKey = 'additionalComment';
  static const String rating = 'additionalComment';
  static const String mapMarkerOrderDetailKey = 'OrderDetail';
  static const String mapMarkerReviewBookNowKey = 'ReviewBookNow';

  ///Fuel Types
  static const String fuelType2WEV = '2W EV';
  static const String fuelTypeEv = 'ev';
  static const String fuelTypeCNG = 'cng';
  static const String fuelTypePetrol = 'petrol';
  static const String fuelTypeAny = 'Book Any';
  static const String fuelTypeServerAny = 'any';

  ///Package Pick and drop status and type
  static const String pickUp = 'pickup';
  static const String drop = 'drop';
  static const String stop = 'stop';

  ///Notifications data keys
  static const String clickActionKey = 'clickAction';
  static const String relationTypeKey = 'relationType';
  static const String relationIDKey = 'relationID';

  ///Orders and PickUp/Drop Status Keys
  static const String liveStatus = 'live';
  static const String waitingStatus = 'waiting';
  static const String noneStatus = 'none';
  static const String pendingStatus = 'pending';
  static const String cancelledStatus = 'cancelled';
  static const String endedStatus = 'ended';
  static const String inProgressStatus = 'inprogress';
  static const String completedStatus = 'completed';
  static const String archived = 'archived';
  static const String customerPurpose = 'customer';
  static const String driverPurpose = 'driverRequest';

  ///payment mode conditions
  static const String cashPaymentMode = 'cash';
  static const String onlinePaymentMode = 'online';
  static const String creditPaymentMode = 'credit';
  static const String creditCashPaymentMode = 'creditCash';
  static const String creditOnlinePaymentMode = 'creditOnline';

  ///Orders qty and cancel reason keys and values
  static const String customQty = 'custom';
  static const String autoCancelBookingType = 'cancelReasonsAdmin';
  static const String automaticCancelledRideReason = 'Automatically cancelled: No drivers assigned';

  ///Notifications Navigation keys
  static const String navNoneScreen = 'none';
  static const String navDashboardScreen = 'dashboard';
  static const String navTrackOrder = 'trackOrder';
  static const String navDetailOrder = 'detailOrder';
  static const String navEndOrder = 'endOrder';
  static const String navOrders = 'orders';
  static const String navProfile = 'profile';
  static const String autoSwitchOrder = 'order';
  static const String adminEndOrder = 'adminEndOrder';

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

  ///All Transactions ID's in the wallet screen
  static const String bookOrderCredit = 'bookOrderCredit';
  static const String bookOrderOnline = 'bookOrderOnline';
  static const String refundOrder = 'refundOrder';
  static const String addCredit = 'addCredit';
  static const String pendingOrderPayment = 'pendingOrderPayment';
  static const String cashbackOrder = 'cashbackOrder';
  static const String orderExtraPickupCharges = 'orderExtraPickupCharges';
  static const String manual = 'manual';

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

  ///Hive Local data manager keys and values
  static const String savedPlacesBox = 'SavedPlaces';
  static const String locationHistoryBox = 'LocationHistory';
  static const String cityListBox = 'Cities';
  static const String contactsListBox = 'Contacts';
  static const String zoneListBox = 'Zones';
  static const String clustersListBox = 'Clusters';
  static const String boundariesLatLngListBox = 'BoundariesLatLng';

  ///Widget key names
  static const String mobileNumberTextFieldKey = 'MobileNumberTextField';
  static const String otpTextFieldKey = 'OTPTextField';
  static const String contactNameTextFieldKey = 'ContactNameTextFieldKey';
  static const String contactNumberTextFieldKey = 'ContactNumberTextFieldKey';
  static const String homePickUpTextFieldKey = 'HomePickUpTextFieldKey';

  ///Analytics Keys
  static const String updatePopUpShown = 'UpdatePopUpShown';
  static const String initialAppOpened = 'InitialAppLaunced';
  static const String currentScreen = 'CurrentScreen';
  static const String verifyOTPAPIEvent = 'VerifyOTP';
  static const String reSendOTPAPIEvent = 'ReSendOTP';
  static const String sendOTPAPIEvent = 'SendOTP';
  static const String userLoggedInEvent = 'UserLoggedIn';
  static const String checkAppVersionAPIEvent = 'CheckAppVersion';
  static const String deviceInfoAPIEvent = 'DeviceInfo';
  static const String cancelOrderAPIEvent = 'CancelOrder';
  static const String ratingDriverAPIEvent = 'RatingDriver';
  static const String applyCouponAPIEvent = 'ApplyCoupon';
  static const String selectCouponEvent = 'SelectedCoupon';
  static const String selectOfferEvent = 'SelectedOffer';
  static const String selectedGoodsTypeEvent = 'SelectedGoodsType';
  static const String googleGeocodeAPIEvent = 'FindLocation';
  static const String googlePlacesAPIEvent = 'GooglePlaces';
  static const String googleComputesDistanceMatrixAPIEvent = 'GoogleComputeRoutes';
  static const String vehicleListWithEstimationAPIEvent = 'VehicleListWithEstimation';
  static const String orderBookingAPIEvent = 'InitiateBooking';
  static const String orderBookingTypeAnyAPIEvent = 'InitiateBookAnyBooking';
  static const String bookNowEvent = 'BookNow';

  ///Booking events
  static const String twoWheelerBookAnyEvent = '2WBookAny';
  static const String scooterBookNowEvent = '2WScooterBooking';
  static const String threeWheelerBookNowEvent = '3WBooking';
  static const String fourWheelerBookNowEvent = '4WBooking';
  static const String enableDriverSearchRadiusEvent = 'DriverSearchRadiusEnabled';

  ///
  static const String vehicleSelectionEvent = 'VehicleSelection';
  static const String dropOnCreditsSelectionEvent = 'DropOnCreditsSelection';
  static const String mailInvoiceAPIEvent = 'MailInvoice';
  static const String initiatePhonePePaymentForBookingAPIEvent = 'InitiatePhonePePaymentForBooking';
  static const String initiateRazorpayPaymentForBookingAPIEvent = 'InitiateRazorpayPaymentForBooking';
  static const String initiatePhonePeAddToWalletAPIEvent = 'InitiatePhonePeAddToWallet';
  static const String initiateRazorpayAddToWalletAPIEvent = 'InitiateRazorpayAddToWallet';
  static const String cancelTransactionEvent = 'CancelTransaction';
  static const String purchaseEvent = 'Purchase';
  static const String customizeLocationEvent = 'LocationUpdated';
  static const String pickUpLocationSelectedEvent = 'PickUpLocationSelected';
  static const String dropLocationSelectedEvent = 'DropLocationSelected';
  static const String onMultipleDropPointSelectEvent = 'SelectMultipleDropPoints';
  static const String updateDropLocationEvent = 'UpdateDropLocation';
  static const String reOrderDropLocationsEvent = 'ReOrderDropLocations';
  static const String deleteDropLocationsEvent = 'DeleteDropLocations';
  static const String updateFavouriteLocationEvent = 'UpdateFavouriteLocation';
  static const String addToWishlistEvent = 'AddToWishlist';
  static const String nearByDriversAPIEvent = 'FetchNearByDrivers';
  static const String bookAgainEvent = 'BookAgain';
  static const String updateProfileEvent = 'UpdateProfile';
  static const String verifyEmailAPIEvent = 'VerifyEmail';
  static const String addCreditToWalletEvent = 'AddCreditToWallet';
  static const String addCreditToWalletWithRazorpayEvent = 'AddCreditToWalletWithRazorpay';
  static const String deleteAccountEvent = 'DeleteAccount';
  static const String userLogoutEvent = 'UserLoggedOut';
  static const String selectedFavouriteAddressEvent = 'SelectedFavouriteAddress';
  static const String saveOrUpdateAddressEvent = 'SaveOrUpdateAddress';
  static const String addAddressToRemoteEvent = 'AddAddressToRemote';
  static const String removeAddressFromLocalEvent = 'RemoveAddressFromLocal';
  static const String removeAllSavedAddressesFromLocalEvent = 'RemovedAllSavedAddressFromLocal';
  static const String exchangeLocationsEvent = 'ExchangeLocations';
  static const String paymentMethodSelectedEvent = 'PaymentMethodSelected';
  static const String searchedPlaceSelect = 'Search';
  static const String localSearchedPlaceSelect = 'LocalAddressSearchSelected';
  static const String localSearchedPlaceResults = 'LocalAddressSearchResults';
  static const String rateEvent = 'Rate';
  static const String referalCodeCopiedEvent = 'ReferalCodeCopied';
  static const String referalCodeSharedEvent = 'ReferalCodeShared';
  static const String appOpenedViaNotifcationEvent = 'AppOpenedViaNotifcation';
  static const String apiCallErrorEvent = 'APICallErrors';
  static const String switchToBookAnyOrderFrom2WEVEvent = 'SwitchToBookAnyOrder';
  static const String ignoreSwitchToBookAnyOrderFrom2WEVEvent = 'IgnoredSwitchToBookAnyOrder';
  static const String switchToBookAnyOrderFrom3WEVEvent = 'SwitchToBook3wAnyOrder';
  static const String ignoreSwitchToBookAnyOrderFrom3WEVEvent = 'IgnoredSwitchTo3WBookAnyOrder';
}
