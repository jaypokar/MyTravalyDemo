import 'package:flutter/material.dart';

import '../../../base/base_stateless_widget.dart';

class TextBoldWidget extends BaseStatelessWidgetState {
  final String data;
  final Color? color;
  final double fontSize;
  final double height;
  final TextAlign textAlign;
  final double letterSpacing;
  final int maxLines;

  const TextBoldWidget({
    required this.data,
    this.color,
    required this.fontSize,
    this.textAlign = TextAlign.center,
    this.height = 0,
    this.letterSpacing = 0,
    this.maxLines = 5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? (isDarkTheme(context) ? Colors.white : Colors.black),
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
