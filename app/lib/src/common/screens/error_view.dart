import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  static const String path = '/ErrorView';
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Something went wrong!')));
  }
}
