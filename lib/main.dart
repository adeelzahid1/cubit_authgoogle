import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cubit_authgoogle/blocs/auth/auth_bloc.dart';
import 'package:cubit_authgoogle/blocs/profile/profile_cubit.dart';
import 'package:cubit_authgoogle/blocs/signin/signin_cubit.dart';
import 'package:cubit_authgoogle/blocs/signup/signup_cubit.dart';
import 'package:cubit_authgoogle/pages/home_page.dart';
import 'package:cubit_authgoogle/pages/signin_page.dart';
import 'package:cubit_authgoogle/pages/signup_page.dart';
import 'package:cubit_authgoogle/pages/splash_page.dart';
import 'package:cubit_authgoogle/repositories/auth_repository.dart';
import 'package:cubit_authgoogle/repositories/profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (context) => 
          AuthRepository(
            firebaseFirestore: FirebaseFirestore.instance,
             firebaseAuth: FirebaseAuth.instance
          ),          
        ),
      RepositoryProvider(create: (context) => 
        ProfileRepository(
            firebaseFirestore: FirebaseFirestore.instance
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => 
          AuthBloc(authRepository: context.read<AuthRepository>())),

          BlocProvider<SigninCubit>(create: (context) => SigninCubit(authRepository: context.read<AuthRepository>())),

          BlocProvider<SignupCubit>(create: (context) => SignupCubit(authRepository: context.read<AuthRepository>(),)),

          BlocProvider<ProfileCubit>(create: (context) => ProfileCubit(profileRepository: context.read<ProfileRepository>(),)),
        ],
        child: MaterialApp(
          title: 'Firebase Auth',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SpalshPage(),
          routes: {
            SignUpPage.routeName : (context) => SignUpPage(),
            SigninPage.routeName : (context) => SigninPage(),
            HomePage.routeName : (context) => HomePage(),
          },
        ),
      ),
    );
  }
}
