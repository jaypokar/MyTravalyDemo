class ConfigFile {
  //Http Requests Base url and End Points
  ///************************************ App Stage ********************************************//

  static const String dev = 'dev';
  static const String prod = 'prod';
  static const String staging = 'staging';

  ///For just practical purpose making sure of running environment
  static const String appMode = dev;
  static const bool shouldShowLogs = true;

  ///************************** Application API Section **************************************///

  static const String visitorToken = '7a1f-1c7c-d871-aaf9-5ada-a1a0-abac-ccae';
  static const String authToken = '71523fdd8d26f585315b4233e39d9263';

  static const String _baseURL = 'https://api.mytravaly.com/public/v1/';

  ///-->Version API URL
  static const String fetchPropertyList = _baseURL;
}
