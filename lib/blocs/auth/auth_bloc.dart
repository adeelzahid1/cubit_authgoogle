import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubit_authgoogle/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription authSubsription;
  late AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthState.unknown()) {
    authSubsription = authRepository.User.listen((fbAuth.User? user) { 
      add(AuthStateChangedEvent(user: user));
    });

  on<AuthStateChangedEvent>((event, emit){
    if(event.user != null){
      emit(state.copyWith(authStatus: AuthStatus.authenticated, user: event.user));
    }
    else{
      emit(state.copyWith(authStatus: AuthStatus.unauthencated, user: null));
    }
  }); 

  on<SignOutRequestedEvent>((event, emit) async{
    await authRepository.signout();
  });

  }
}
