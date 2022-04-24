part of 'signin_cubit.dart';

class SigninState extends Equatable {
  final SigninStatus signinStatus;
  final CustomError customError;

  const SigninState({required this.customError, required this.signinStatus});

  factory SigninState.initial(){
    return SigninState(
      customError: CustomError(), 
      signinStatus: SigninStatus.initial,
      );
  }

  @override
  List<Object> get props => [signinStatus, customError];

  @override
  String toString() => 'SigninState(signinStatus: $signinStatus, customError: $customError)';

  SigninState copyWith({
    SigninStatus? signinStatus,
    CustomError? customError,
  }) {
    return SigninState(
      signinStatus: signinStatus ?? this.signinStatus,
      customError: customError ?? this.customError,
    );
  }
}


enum SigninStatus {initial, submitting, success, error}
