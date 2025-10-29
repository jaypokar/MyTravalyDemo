import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytravaly/data/model/property_list_model.dart';
import 'package:mytravaly/data/model/searched_property_list_model.dart';

import '../../../core/logger.dart';
import '../../../domain/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const HomeInitial()) {
    //fetching Dashboard home data by calling [FetchHomeDataEvent] event and update home state
    // with[HomeDataLoadedState].
    on<FetchHomeDataEvent>(_fetchHomeData);

    //in case of and error while processing above events this is error state.
    on<OnHomeErrorEvent>(
      (OnHomeErrorEvent event, Emitter<HomeState> emit) =>
          emit(HomeErrorState(error: event.error, errorCode: event.errorCode)),
    );
  }

  FutureOr<void> _fetchHomeData(FetchHomeDataEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoadingState());
    try {
      final possibleData = await _repository.fetchHomeData();
      possibleData.fold(
        (l) => add(OnHomeErrorEvent(error: l.error, errorCode: l.statusCode)),
        (r) => emit(LoadHomeDataState(property: r)),
      );
    } catch (e) {
      add(OnHomeErrorEvent(error: e.toString(), errorCode: 0));
    }
  }

  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    super.onTransition(transition);
    logger.d(
      'the Event Triggered is ${transition.event} and the State Emitted is : ${transition.nextState}',
    );
  }
}
