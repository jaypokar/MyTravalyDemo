import 'package:flutter/material.dart';

class BouncingIconDemo extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const BouncingIconDemo({
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    super.key,
  });

  @override
  State<BouncingIconDemo> createState() => _BouncingIconDemoState();
}

class _BouncingIconDemoState extends State<BouncingIconDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true, count: 8);

    _animation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
