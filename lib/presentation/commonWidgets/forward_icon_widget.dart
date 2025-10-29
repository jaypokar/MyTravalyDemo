import 'package:flutter/material.dart';

import '../../base/base_stateless_widget.dart';
import '../../resources/color_constants.dart';
import '../../resources/image_resources.dart';

class ForwardIconWidget extends BaseStatelessWidgetState {
  final double height;
  final double width;

  const ForwardIconWidget({this.height = 40, this.width = 40, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkTheme(context)
            ? ColorConstants.forwardBgColorDark
            : ColorConstants.forwardBgColorLight,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: /*isDarkTheme(context) ? ColorConstants.textColor2 : Colors.black12*/
              Colors.transparent,
        ),
      ),
      padding: const EdgeInsets.all(5),
      height: height,
      width: width,
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          ImageResources.arrowRightIcon,
          height: 16,
          color: isDarkTheme(context) ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
