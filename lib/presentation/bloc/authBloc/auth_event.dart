part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class OnSignInWithGoogleEvent extends AuthEvent {
  const OnSignInWithGoogleEvent();

  @override
  List<Object?> get props => [];
}

class OnSignInWithEmailPassEvent extends AuthEvent {
  final String email;
  final String pass;

  const OnSignInWithEmailPassEvent({required this.email, required this.pass});

  @override
  List<Object?> get props => [email, pass];
}

class OnSignUpWithEmailPassEvent extends AuthEvent {
  final String userName;
  final String email;
  final String pass;

  const OnSignUpWithEmailPassEvent({required this.userName, required this.email, required this.pass});

  @override
  List<Object?> get props => [userName, email, pass];
}

// This event will be triggered when any error occurs while authentication
//This can be due to network issues or login error.
class OnAuthErrorEvent extends AuthEvent {
  final String error;
  final int errorCode;

  const OnAuthErrorEvent({required this.error, required this.errorCode});

  @override
  List<Object> get props => <Object>[error, errorCode];
}
