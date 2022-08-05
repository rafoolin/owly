import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  static const String path = '/ErrorView';
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error!')),
      body: const Center(child: Text('Something went wrong!')),
    );
  }
}
