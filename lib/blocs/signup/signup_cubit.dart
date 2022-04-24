import 'package:bloc/bloc.dart';
import 'package:cubit_authgoogle/models/custom_error.dart';
import 'package:cubit_authgoogle/repositories/auth_repository.dart';
import 'signup_state.dart';


class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;

  SignupCubit({required this.authRepository}) : super(SignupState.initial());

  Future<void> signup({required String name, required String email, required String password})
  async {
    emit(state.copyWith(signupStatus: SignupStatus.submitting));

    try {
      await authRepository.signup(name: name, email: email, password: password);
      emit(state.copyWith(signupStatus: SignupStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(signupStatus: SignupStatus.error, customError: e));
    }
  }
  

}
