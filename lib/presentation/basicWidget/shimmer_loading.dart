import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../base/base_stateless_widget.dart';

class ShimmerLoading extends BaseStatelessWidgetState {
  final Widget child;
  final Color? shimmerColor;

  const ShimmerLoading({required this.child, this.shimmerColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerColor ?? (isDarkTheme(context) ? Colors.white12 : Colors.white54),
      highlightColor: shimmerColor ?? (isDarkTheme(context) ? Colors.white12 : Colors.white54),
      child: child,
    );
  }
}
