import 'package:flutter/material.dart';

import '../../resources/color_constants.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  final double size;
  final double margin;

  const LoadingWidget({
    this.color = ColorConstants.appColor,
    this.size = 40, //default size for all button is 48
    this.margin = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.all(margin),
        child: const CircularProgressIndicator(
          strokeWidth: 1,
          color: Colors.white,
        ),
      ),
    );
  }
}
