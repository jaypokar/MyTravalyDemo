import 'package:flutter/material.dart';

import '../../base/base_stateless_widget.dart';
import '../../resources/color_constants.dart';
import 'material_touch_bg.dart';

class BackIconWidget extends BaseStatelessWidgetState {
  final Color? bgColor;
  final Color iconColor;
  final double height;
  final double width;
  final Function onTap;

  const BackIconWidget({
    this.bgColor,
    this.iconColor = Colors.white,
    this.height = 40,
    this.width = 40,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialTouchBg(
      onTap: onTap,
      padding: EdgeInsets.zero,
      bgColor:
          bgColor ??
          (isDarkTheme(context)
              ? ColorConstants.darkBackground2
              : ColorConstants.backButtonBgColorLight),
      child: SizedBox(
        height: height,
        width: width,
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: isDarkTheme(context) ? Colors.white : Colors.black,
            size: 16,
          ),
        ),
      ),
    );
  }
}
