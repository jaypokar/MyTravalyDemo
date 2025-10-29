import 'package:flutter/material.dart';

/// A reusable widget that provides opacity animation.
class FadeAnimation extends StatefulWidget {
  final Widget child;
  final Duration? delay; // Optional delay before the animation starts.
  final Duration duration; // Duration of the opacity animation.

  const FadeAnimation({
    super.key,
    required this.child,
    this.delay,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Define the opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
