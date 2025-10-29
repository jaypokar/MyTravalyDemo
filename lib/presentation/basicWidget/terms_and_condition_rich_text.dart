import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../resources/color_constants.dart';

// ignore: must_be_immutable
class TermAndConditionRichText extends StatelessWidget {
  final Function? onClickTermsEvent;
  final Function? onPrivacyEvent;
  final String textOne;
  final String textTwo;
  final String textThree;
  final String textFour;
  Color? color;
  Color? firstTextColor;
  final double textSize;
  final FontWeight fontWeight;
  double letterSpacing = 0;

  TermAndConditionRichText({
    required this.onClickTermsEvent,
    required this.onPrivacyEvent,
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    required this.textFour,
    this.textSize = 12,
    this.firstTextColor = ColorConstants.black,
    this.color = ColorConstants.appColor,
    this.fontWeight = FontWeight.bold,
    this.letterSpacing = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(
          fontSize: textSize,
          color: firstTextColor,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
          letterSpacing: letterSpacing,
        ),
        children: <TextSpan>[
          TextSpan(text: textOne),
          TextSpan(
              text: textTwo,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: fontWeight,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (onClickTermsEvent != null) {
                    onClickTermsEvent!();
                  }
                }),
          TextSpan(text: textThree),
          TextSpan(
              text: textFour,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: fontWeight,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (onPrivacyEvent != null) {
                    onPrivacyEvent!();
                  }
                }),
        ],
      ),
    );
  }
}
