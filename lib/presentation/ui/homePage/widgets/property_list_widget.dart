import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytravaly/presentation/basicWidget/loading_widget.dart';
import 'package:mytravaly/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:mytravaly/presentation/ui/homePage/widgets/property_item_widget.dart';

class PropertyListWidget extends StatelessWidget {
  const PropertyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const LoadingWidget();
        } else if (state is LoadHomeDataState) {
          final list = state.property;
          return ListView.separated(
            itemCount: list.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return PropertyItemWidget(
                property: list[index],
              );
            },
            padding: EdgeInsets.zero,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
