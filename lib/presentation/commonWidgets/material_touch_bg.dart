import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';

import '../../base/base_stateless_widget.dart';
import '../../resources/color_constants.dart';

class MaterialTouchBg extends BaseStatelessWidgetState {
  final Color? bgColor;
  final Color? borderColor;
  final Color? splashColor;
  final Color? shadowColor;
  final double? borderRadius;
  final Widget child;
  final Function? onTap;
  final double borderWidth;
  final double elevation;
  final EdgeInsetsGeometry? padding;

  const MaterialTouchBg({
    this.bgColor,
    this.borderColor,
    this.splashColor,
    this.shadowColor,
    this.borderRadius,
    required this.child,
    this.onTap,
    this.borderWidth = 1,
    this.elevation = 1,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shadowColor: shadowColor ?? (isDarkTheme(context) ? Colors.white38 : ColorConstants.greyColor),
      color:
          bgColor ??
          (isDarkTheme(context) ? ColorConstants.darkBackground2 : ColorConstants.lightBackground2),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
      ),
      child: InkWell(
        splashColor: splashColor ?? Theme.of(context).splashColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
        onTap: onTap != null
            ? (() {
                EasyThrottle.throttle('clickEvent', const Duration(milliseconds: 650), () async {
                  onTap!();
                });
              })
            : null,
        child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
      ),
    );
  }
}
