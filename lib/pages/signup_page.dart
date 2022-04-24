import 'package:flutter/material.dart';
class SignUpPage  extends StatelessWidget {
    static const String routeName = '/sigup';
  const SignUpPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('SignUp'),),
    );
  }
}