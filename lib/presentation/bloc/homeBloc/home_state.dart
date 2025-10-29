part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => <Object>[];
}

class LoadHomeDataState extends HomeState {
  final List<Property> property;

  const LoadHomeDataState({required this.property});

  @override
  List<Object> get props => <Object>[property];
}

class LoadSearchedHotelsState extends HomeState {
  final List<ArrayOfHotelList> hotelList;

  const LoadSearchedHotelsState({required this.hotelList});

  @override
  List<Object> get props => <Object>[hotelList];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();

  @override
  List<Object> get props => <Object>[];
}

class HomeErrorState extends HomeState {
  final String error;
  final int errorCode;

  const HomeErrorState({required this.error, required this.errorCode});

  @override
  List<Object> get props => <Object>[error, errorCode];
}
