import 'package:flutter/material.dart';

import '../../../../resources/image_resources.dart';

class AppIconWidget extends StatefulWidget {
  const AppIconWidget({super.key});

  @override
  State<AppIconWidget> createState() => _AppIconWidgetState();
}

class _AppIconWidgetState extends State<AppIconWidget> with TickerProviderStateMixin {
  late final AnimationController _cashbackController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _cashbackAnimation = CurvedAnimation(
    parent: _cashbackController,
    curve: Curves.decelerate,
  );

  @override
  void initState() {
    _cashbackController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _cashbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _cashbackAnimation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          ImageResources.appIcon,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
      ),
    );
  }
}
