part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class OnFetchProfileEvent extends ProfileEvent {
  const OnFetchProfileEvent();

  @override
  List<Object?> get props => <Object?>[];
}



class OnUpdateGSTNoEvent extends ProfileEvent {
  final String gstNo;

  const OnUpdateGSTNoEvent({required this.gstNo});

  @override
  List<Object?> get props => <Object?>[gstNo];
}

class OnAddMoneyProfileEvent extends ProfileEvent {
  final num amount;
  final String paymentGateway;

  const OnAddMoneyProfileEvent({
    required this.amount,
    this.paymentGateway = ValueKeyResources.razorpayPaymentGateway,
  });

  @override
  List<Object?> get props => <Object?>[amount, paymentGateway];
}

class OnVerifyEmailEvent extends ProfileEvent {
  final String email;

  const OnVerifyEmailEvent({required this.email});

  @override
  List<Object?> get props => <Object?>[email];
}

class OnDeleteUserEvent extends ProfileEvent {
  const OnDeleteUserEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class OnProfileErrorEvent extends ProfileEvent {
  final String error;
  final int errorCode;

  const OnProfileErrorEvent({
    required this.error,
    required this.errorCode,
  });

  @override
  List<Object?> get props => <Object?>[error, errorCode];
}
