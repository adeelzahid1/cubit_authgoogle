import 'package:flutter/material.dart';

class SpalshPage extends StatelessWidget {
    static const String routeName = '/';
  const SpalshPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}