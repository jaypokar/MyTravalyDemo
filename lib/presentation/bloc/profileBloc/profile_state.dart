part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();

  @override
  List<Object> get props => <Object>[];
}

class LoadingProfileState extends ProfileState {
  const LoadingProfileState();

  @override
  List<Object> get props => <Object>[];
}

class LoadingProfileGSTState extends ProfileState {
  const LoadingProfileGSTState();

  @override
  List<Object> get props => <Object>[];
}

class LoadProfileState extends ProfileState {
  const LoadProfileState();

  @override
  List<Object> get props => <Object>[];
}

class LoadAddMoneyProfileState extends ProfileState {
  const LoadAddMoneyProfileState();

  @override
  List<Object> get props => <Object>[];
}

class LoadingDeleteUserState extends ProfileState {
  const LoadingDeleteUserState();

  @override
  List<Object> get props => <Object>[];
}


class LoadProfileErrorState extends ProfileState {
  final String error;
  final int errorCode;

  const LoadProfileErrorState({required this.error, required this.errorCode});

  @override
  List<Object> get props => <Object>[error, errorCode];
}
