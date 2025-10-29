import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytravaly/presentation/bloc/profileBloc/profile_bloc.dart';
import 'package:mytravaly/resources/app_router.dart';

import '../../../base/base_stateful_widget.dart';
import 'widgets/app_icon_widget.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends BaseStatefulWidgetState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() => Future.delayed(const Duration(seconds: 3)).then((_) {
        if (mounted && context.read<ProfileBloc>().checkUserLoggedIn()) {
          pushReplacement(const HomeRoute());
        } else {
          pushReplacement(const AuthenticationRoute());
        }
      });

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const Center(child: AppIconWidget()),
      );
}
