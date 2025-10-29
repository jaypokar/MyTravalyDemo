import 'package:logger/logger.dart';

import '../resources/config_file.dart';

final Logger logger = Logger(filter: MyFilter(), printer: PrefixPrinter(PrettyPrinter(colors: false)));

//TODO custom class for filtering and to log only in development mode so Log should be 'false'
//TODO in Production phase and 'true' while Development Phase.
//if you don/t want to print the log with color then remove the PrettyPrinter().

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return ConfigFile.shouldShowLogs;
  }
}
