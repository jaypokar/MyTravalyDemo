import 'package:flutter/material.dart';

import '../../base/base_stateless_widget.dart';
import '../../resources/color_constants.dart';

class PopUpBgWidget extends BaseStatelessWidgetState {
  final Widget widget;
  final Color color;
  final double horizontalPadding;
  final Color borderColor;
  final double padding;

  const PopUpBgWidget({
    required this.widget,
    this.color = Colors.white,
    this.horizontalPadding = 15,
    this.padding = 10,
    this.borderColor = ColorConstants.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: isDarkTheme(context) ? ColorConstants.darkBackground1 : ColorConstants.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border.all(color: isDarkTheme(context) ? ColorConstants.textColor2 : Colors.black12),
      ),
      padding: EdgeInsets.only(
        left: padding,
        right: padding,
        top: padding,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: widget,
    );
  }
}
