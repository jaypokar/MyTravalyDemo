import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// A reusable widget that provides opacity animation.
class BounceAnimation extends StatefulWidget {
  final Widget child;
  final Duration? delay; // Optional delay before the animation starts.
  final Duration duration; // Duration of the opacity animation.

  const BounceAnimation({
    super.key,
    required this.child,
    this.delay,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  SpringSimulation? _simulation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      lowerBound: 0,
      upperBound: double.infinity,
    );

    _simulation = SpringSimulation(
      const SpringDescription(
        mass: 0.5,
        stiffness: 100,
        damping: 10,
      ),
      0,
      300,
      0,
    );

    _controller.animateWith(_simulation!);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _controller.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
