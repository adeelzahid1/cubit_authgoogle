import 'package:flutter/material.dart';
class SigninPage  extends StatelessWidget {
    static const String routeName = '/signin';
  const SigninPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('SignIN'),),
    );
  }
}