import 'package:cubit_authgoogle/blocs/auth/auth_bloc.dart';
import 'package:cubit_authgoogle/pages/home_page.dart';
import 'package:cubit_authgoogle/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpalshPage extends StatelessWidget {
  static const String routeName = '/';
  const SpalshPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print('Listner $state');
        if(state.authStatus == AuthStatus.unauthencated){
          // Navigator.pushNamed(context, SigninPage.routeName);
            Navigator.pushNamedAndRemoveUntil(context, SigninPage.routeName,
             (route){
               print('Route Setting name : ${route.settings.name}');
               print('Modal Route : ${ModalRoute.of(context)!.settings.name}');
               return route.settings.name == ModalRoute.of(context)!.settings.name ? true : false;
             });



        }
        else if(state.authStatus == AuthStatus.authenticated){
          Navigator.pushNamed(context, HomePage.routeName);
        }
      },
      builder: (context, state) {
        print('Builder . $state');
        return Container(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
