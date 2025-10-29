part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object> get props => <Object>[];
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();

  @override
  List<Object?> get props => <Object?>[];
}

class AuthErrorState extends AuthState {
  final String message;
  final int errorCode;

  const AuthErrorState({required this.message, required this.errorCode});

  @override
  List<Object?> get props => <Object?>[message, errorCode];
}

class AuthenticatedState extends AuthState {
  const AuthenticatedState();

  @override
  List<Object?> get props => <Object?>[];
}
