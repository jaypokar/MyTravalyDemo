import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytravaly/core/either_extension_function.dart';

import '../../../core/failure.dart';
import '../../../core/logger.dart';
import '../../../domain/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc(this._repository) : super(const AuthInitial()) {
    // When user clicks on signin with google
    on<OnSignInWithGoogleEvent>(_onSignInOrSignUpWithGoogle);

    // When user clicks on signin with email pass
    on<OnSignInWithEmailPassEvent>(_onSignInWithEmailPass);

    // When user clicks on signup with email pass
    on<OnSignUpWithEmailPassEvent>(_onSignUpWithEmailPass);

    // When any error occurs while authentication
    on<OnAuthErrorEvent>(
      (OnAuthErrorEvent event, Emitter<AuthState> emit) =>
          emit(AuthErrorState(message: event.error, errorCode: event.errorCode)),
    );
  }

  Future<void> _onSignInOrSignUpWithGoogle(
      OnSignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());
    try {
      /// fetch signin result from the repo
      final result = await _repository.signInWithGoogle();

      ///handle result with updating the state
      result.fold(
        (Failure l) => add(OnAuthErrorEvent(error: l.error, errorCode: result.getLeft()!.statusCode)),
        (_) => emit(const AuthenticatedState()),
      );
    } catch (e) {
      emit(AuthErrorState(message: e.toString(), errorCode: 0));
    }
  }

  Future<void> _onSignUpWithEmailPass(OnSignUpWithEmailPassEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());
    try {
      /// fetch signin result from the repo
      final result = await _repository.signUpWithEmailPassword(
          userName: event.userName, email: event.email, password: event.pass);

      ///handle result with updating the state
      result.fold(
        (Failure l) => add(OnAuthErrorEvent(error: l.error, errorCode: result.getLeft()!.statusCode)),
        (_) => emit(const AuthenticatedState()),
      );
    } catch (e) {
      emit(AuthErrorState(message: e.toString(), errorCode: 0));
    }
  }

  Future<void> _onSignInWithEmailPass(OnSignInWithEmailPassEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());
    try {
      /// fetch signin result from the repo
      final result = await _repository.signInWithEmailPassword(email: event.email, password: event.pass);

      ///handle result with updating the state
      result.fold(
        (Failure l) => add(OnAuthErrorEvent(error: l.error, errorCode: result.getLeft()!.statusCode)),
        (_) => emit(const AuthenticatedState()),
      );
    } catch (e) {
      emit(AuthErrorState(message: e.toString(), errorCode: 0));
    }
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    logger.d(
      'the Event Triggered is ${transition.event} and the State Emitted is : ${transition.nextState}',
    );
  }
}
