part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchHomeDataEvent extends HomeEvent {
  const FetchHomeDataEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class OnSearchHotelsEvent extends HomeEvent {
  final String searchQuery;
  const OnSearchHotelsEvent({required this.searchQuery});

  @override
  List<Object?> get props => <Object?>[searchQuery];
}

class OnHomeErrorEvent extends HomeEvent {
  final String error;
  final int errorCode;

  const OnHomeErrorEvent({
    required this.error,
    required this.errorCode,
  });

  @override
  List<Object?> get props => <Object?>[error, errorCode];
}
