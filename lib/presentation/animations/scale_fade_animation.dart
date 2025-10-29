import 'package:flutter/material.dart';

/// A reusable widget that provides both scale and opacity animations.
class ScaleFadeAnimation extends StatefulWidget {
  final Widget child;
  final Duration? delay; // Optional delay before the animation starts.
  final Duration duration; // Duration of the animation.
  final double scaleBeginPosition;
  final double scaleEndPosition;

  const ScaleFadeAnimation(
      {super.key,
      required this.child,
      this.delay,
      this.duration = const Duration(milliseconds: 500),
      this.scaleBeginPosition = 0.7,
      this.scaleEndPosition = 1.0});

  @override
  State<ScaleFadeAnimation> createState() => _ScaleFadeAnimationState();
}

class _ScaleFadeAnimationState extends State<ScaleFadeAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with the given duration.
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Define the opacity animation (fade-in effect).
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn, // Smooth fade-in effect.
      ),
    );

    // Define the scale animation (zoom-in effect).
    _scaleAnimation =
        Tween<double>(begin: widget.scaleBeginPosition, end: widget.scaleEndPosition).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut, // Smooth scaling effect.
      ),
    );

    // Start the animation after an optional delay.
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    if (widget.delay != null) {
      await Future.delayed(widget.delay!);
    }
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller to free resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value, // Apply scale transformation.
          child: Opacity(
            opacity: _opacityAnimation.value, // Apply opacity transformation.
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
