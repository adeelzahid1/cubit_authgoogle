import 'package:cubit_authgoogle/models/custom_error.dart';
import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final SignupStatus signupStatus;
  final CustomError customError;

  const SignupState({required this.customError, required this.signupStatus});

  factory SignupState.initial(){
    return SignupState(
      customError: CustomError(), 
      signupStatus: SignupStatus.initial,
      );
  }

  @override
  List<Object> get props => [signupStatus, customError];

  @override
  String toString() => 'SigninState(signinStatus: $signupStatus, customError: $customError)';

  SignupState copyWith({
    SignupStatus? signupStatus,
    CustomError? customError,
  }) {
    return SignupState(
      signupStatus: signupStatus ?? this.signupStatus,
      customError: customError ?? this.customError,
    );
  }
}


enum SignupStatus {initial, submitting, success, error}
