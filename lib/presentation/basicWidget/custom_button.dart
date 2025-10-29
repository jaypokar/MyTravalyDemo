import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:mytravaly/presentation/basicWidget/textWidgets/text_bold_widget.dart';
import 'package:mytravaly/presentation/basicWidget/textWidgets/text_semibold_widget.dart';

import '../../base/base_stateless_widget.dart';
import '../../resources/color_constants.dart';

class ButtonWidget extends BaseStatelessWidgetState {
  final String buttonText;
  final Function onPressButton;
  final bool isWrap;
  final double padding;
  final double buttonPaddingLeft;
  final double buttonPaddingRight;
  final double buttonPaddingTop;
  final double buttonPaddingBottom;
  final Color color;
  final Color textColor;
  final double textSize;
  final double height;
  final double radius;
  final bool isEnabled;
  final FontWeight buttonTextFontWeight;

  const ButtonWidget({
    required this.buttonText,
    required this.onPressButton,
    this.isWrap = false,
    this.padding = 10,
    this.textSize = 14,
    this.isEnabled = true,
    this.buttonPaddingLeft = 0,
    this.buttonPaddingRight = 0,
    this.buttonPaddingTop = 0,
    this.buttonPaddingBottom = 0,
    this.height = 40,
    this.radius = 5,
    this.color = ColorConstants.appColor,
    this.buttonTextFontWeight = FontWeight.w800,
    this.textColor = ColorConstants.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == 0
          ? EdgeInsets.only(
              left: buttonPaddingLeft,
              right: buttonPaddingRight,
              bottom: buttonPaddingBottom,
              top: buttonPaddingTop,
            )
          : EdgeInsets.all(padding),
      child: ElevatedButton(
        style: isWrap
            ? ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: color,
                disabledBackgroundColor: isDarkTheme(context)
                    ? ColorConstants.darkBackground2
                    : ColorConstants.lightBackground1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
              )
            : ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: color,
                minimumSize: Size.fromHeight(height),
                disabledBackgroundColor: isDarkTheme(context)
                    ? ColorConstants.darkBackground2
                    : ColorConstants.lightBackground1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
              ),
        onPressed: isEnabled
            ? () {
                EasyThrottle.throttle('clickEvent', const Duration(milliseconds: 650), () async {
                  onPressButton();
                });
              }
            : null,
        child: Padding(
          padding: EdgeInsets.only(
            left: buttonPaddingLeft,
            right: buttonPaddingRight,
            top: buttonPaddingTop,
            bottom: buttonPaddingTop,
          ),
          child: buttonTextFontWeight == FontWeight.w700
              ? TextBoldWidget(data: buttonText, color: textColor, fontSize: textSize)
              : TextSemiBoldWidget(data: buttonText, textColor: textColor, fontSize: textSize),
        ),
      ),
    );
  }
}
