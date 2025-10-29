import 'package:flutter/material.dart';

import '../../resources/color_constants.dart';

class MaterialCardWidget extends StatelessWidget {
  final Widget child;
  final double padding;
  final Color bgColor;
  final Color borderColor;
  final double elevation;
  final double borderRadius;
  final double margin;
  final double borderColorWidth;

  const MaterialCardWidget({
    required this.child,
    this.padding = 10,
    this.elevation = 10,
    this.borderRadius = 10,
    this.borderColorWidth = 1,
    this.margin = 0,
    this.bgColor = Colors.white,
    this.borderColor = ColorConstants.lightGreenBgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin),
      child: Material(
        elevation: elevation,
        type: MaterialType.card,
        color: Colors.transparent,
        shadowColor: Colors.grey.withOpacity(0.2),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor, width: borderColorWidth),
          ),
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
