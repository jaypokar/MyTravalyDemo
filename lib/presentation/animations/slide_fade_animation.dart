import 'package:flutter/material.dart';

/// A reusable widget that provides both slide and opacity animations.
class SlideFadeAnimation extends StatefulWidget {
  final Widget child;
  final Duration? delay; // Optional delay before the animation starts.
  final Duration duration; // Duration of the animation.
  final double positionBegin;
  final double positionEnd;
  final bool? isXAxisAnimation;

  const SlideFadeAnimation(
      {super.key,
      required this.child,
      this.delay,
      this.duration = const Duration(milliseconds: 500),
      this.positionBegin = -40,
      this.positionEnd = 0,
      this.isXAxisAnimation = false});

  @override
  State<SlideFadeAnimation> createState() => _SlideFadeAnimationState();
}

class _SlideFadeAnimationState extends State<SlideFadeAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _positionAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Define the slide animation
    _positionAnimation = Tween<double>(begin: widget.positionBegin, end: widget.positionEnd).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
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
        return Transform.translate(
          offset: Offset(widget.isXAxisAnimation == true ? _positionAnimation.value : 0,
              widget.isXAxisAnimation == true ? 0 : _positionAnimation.value),
          // Slide animation
          child: Opacity(
            opacity: _opacityAnimation.value, // Opacity animation
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
