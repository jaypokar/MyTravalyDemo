import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytravaly/core/either_extension_function.dart';

import '../../../core/failure.dart';
import '../../../core/logger.dart';
import '../../../domain/profile_repository.dart';
import '../../../resources/value_key_resources.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repository;

  ProfileBloc(this._repository) : super(const ProfileInitial()) {
    //in case of and error while processing above events this is error state.
    on<OnProfileErrorEvent>(
      (OnProfileErrorEvent event, Emitter<ProfileState> emit) =>
          emit(LoadProfileErrorState(error: event.error, errorCode: event.errorCode)),
    );
  }

  FutureOr<void> _verifyEmail(OnVerifyEmailEvent event, Emitter<ProfileState> emit) async {
    final Either<Failure, Unit> emailVerificationRes = await _repository.verifyEmail(email: event.email);
    logger.i(
      'the response from : ${emailVerificationRes.isLeft() ? emailVerificationRes.getLeft() : emailVerificationRes.getRight()}',
    );
  }

  bool checkUserLoggedIn() => _repository.checkIfUserLoggedIn();

  void initiateLogoutProcess() => _repository.initiateLogoutProcess();

  @override
  void onTransition(Transition<ProfileEvent, ProfileState> transition) {
    super.onTransition(transition);
    logger.d(
      'the Event Triggered is ${transition.event} and the State Emitted is : ${transition.nextState}',
    );
  }
}
