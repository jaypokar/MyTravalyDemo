import 'package:flutter/material.dart';

import '../../resources/color_constants.dart';

// ignore: must_be_immutable
class AuthRichTextWidget extends StatelessWidget {
  final Function? onClickEvent;
  final String textOne;
  final String textTwo;
  Color? color;
  Color? firstTextColor;
  final double textSize;
  final FontWeight fontWeight;
  double letterSpacing = 0;
  final TextAlign textAlign;

  AuthRichTextWidget({
    required this.onClickEvent,
    required this.textOne,
    required this.textTwo,
    this.textSize = 12,
    this.firstTextColor = ColorConstants.black,
    this.color = ColorConstants.appColor,
    this.fontWeight = FontWeight.bold,
    this.letterSpacing = 0,
    this.textAlign = TextAlign.left,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //widget.pageController.jumpToPage(0);
        if (onClickEvent != null) {
          onClickEvent!();
        }
      },
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          style: TextStyle(
            fontSize: textSize,
            color: firstTextColor,
            fontFamily: 'Urbanist',
            letterSpacing: letterSpacing,
            height: 1.3,
          ),
          children: <TextSpan>[
            TextSpan(text: textOne),
            TextSpan(
                text: textTwo,
                style: TextStyle(
                  color: color,
                  fontWeight: fontWeight,
                )),
          ],
        ),
      ),
    );
  }
}
