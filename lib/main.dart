import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytravaly/presentation/bloc/authBloc/auth_bloc.dart';
import 'package:mytravaly/presentation/bloc/profileBloc/profile_bloc.dart';
import 'package:mytravaly/presentation/cubit/appThemeCubit/app_theme_cubit.dart';
import 'package:mytravaly/resources/app_router.dart';
import 'package:mytravaly/resources/app_theme.dart';
import 'package:mytravaly/resources/string_resources.dart';

import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'navigationArgs/navigation_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init().then(
        (value) => runApp(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => sl<AppThemeCubit>(),
              ),
            ],
            child: const MyApp(),
          ),
        ),
      );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    sl<AppTheme>().setInitialTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(create: (_) => sl<ProfileBloc>()),
        BlocProvider<AuthBloc>(create: (_) => sl<AuthBloc>()),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: StringResources.appName,
              themeMode: sl<AppTheme>().getAppThemeMode(),
              theme: sl<AppTheme>().getLightTheme(),
              darkTheme: sl<AppTheme>().getDarkTheme(),
              builder: (BuildContext? context, Widget? child) => (context != null && child != null)
                  ? MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: child,
                    )
                  : const SizedBox.shrink(),
              routerDelegate: AutoRouterDelegate(
                sl<AppRouter>(),
                navigatorObservers: () => <NavigatorObserver>[sl<NavigationObserver>()],
              ),
              routeInformationParser: sl<AppRouter>().defaultRouteParser(),
            );
          },
        ),
      ),
    );
  }
}
