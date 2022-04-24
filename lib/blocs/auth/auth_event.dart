part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  
  @override
  List<Object?> get props => [];
}

class AuthStateChangedEvent extends AuthEvent{
  final fbAuth.User? user;
  AuthStateChangedEvent({this.user});

    List<Object?> get props => [user];
}


class SignOutRequestedEvent extends AuthEvent{
  
}