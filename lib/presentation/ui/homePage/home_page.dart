import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytravaly/base/base_stateful_widget.dart';
import 'package:mytravaly/presentation/ui/homePage/widgets/toolbar_widget.dart';

import '../../../injection_container.dart';
import '../../../util/common_functions.dart';
import '../../bloc/homeBloc/home_bloc.dart';
import 'widgets/property_list_widget.dart';
import 'widgets/search_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (_) => sl<HomeBloc>()),
      ],
      child: this,
    );
  }
}

class _HomePageState extends BaseStatefulWidgetState<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const FetchHomeDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: sl<CommonFunctions>().pageEdgeToEdgePadding(
            top: MediaQuery.of(context).viewPadding.top,
            bottom: MediaQuery.of(context).viewPadding.bottom),
        child: const SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              ToolbarWidget(),
              SizedBox(height: 10),
              SearchWidget(),
              SizedBox(height: 20),
              PropertyListWidget(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
