import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../presentation/basicWidget/textWidgets/text_bold_widget.dart';
import '../presentation/basicWidget/textWidgets/text_semibold_widget.dart';

class CommonFunctions {
  static const String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final Random _rnd = Random();

  CommonFunctions();

  MaterialColor createMaterialColor(Color color) {
    final List<double> strengths = <double>[.05];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    // ignore: avoid_function_literals_in_foreach_calls

    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void showSnackBar({
    required BuildContext context,
    required String message,
    required Color bgColor,
    required Color textColor,
    int duration = 2,
  }) {
    final SnackBar snackBar = SnackBar(
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      duration: Duration(seconds: duration),
      content: TextSemiBoldWidget(
        data: message,
        textAlign: TextAlign.center,
        textColor: textColor,
        fontSize: 14,
      ),
      backgroundColor: bgColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showFlushBar({
    required BuildContext context,
    required String message,
    required Color bgColor,
    required Color textColor,
    double textSize = 14,
    int duration = 2,
  }) {
    final SnackBar snackBar = SnackBar(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 150, right: 10, left: 10),
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      duration: Duration(seconds: duration),
      content: TextBoldWidget(
        data: message,
        textAlign: TextAlign.center,
        color: textColor,
        fontSize: textSize,
      ),
      backgroundColor: bgColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String getGreetings() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning!';
    }
    if (hour < 17) {
      return 'Good Afternoon!';
    }
    return 'Good Evening!';
  }

  void animateWidgetWhenKeyboardOpens({
    required ScrollController scrollController,
    required bool isKeyBoardVisible,
  }) {
    scrollController.animateTo(
      isKeyBoardVisible ? scrollController.position.pixels + 90 : scrollController.position.pixels - 90,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
  }

  Future<dynamic> showDialogPopUp({
    required BuildContext context,
    required Widget widget,
    bool isDismissible = true,
    double padding = 0,
    Alignment alignment = Alignment.bottomCenter,
    Color bgColor = Colors.transparent,
  }) async {
    final result = await showModalBottomSheet(
      context: context,
      enableDrag: isDismissible,
      isScrollControlled: true,
      isDismissible: isDismissible,
      useSafeArea: false,
      builder: (BuildContext context) {
        return widget;
      },
    );
    return result;
  }

  EdgeInsets pageEdgeToEdgePadding({
    double left = 15,
    double right = 15,
    double bottom = 20,
    double top = 20,
  }) =>
      EdgeInsets.only(left: left, bottom: bottom, right: right, top: top);
}
