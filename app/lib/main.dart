import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/my_app.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
