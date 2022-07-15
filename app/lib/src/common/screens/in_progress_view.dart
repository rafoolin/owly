import 'package:flutter/material.dart';

class InProgressView extends StatelessWidget {
  static const String path = '/InProgressView';
  const InProgressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
