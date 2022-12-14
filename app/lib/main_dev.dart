import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/app_flavor/domain/flavor_config.dart';
import 'src/app_flavor/presentation/app_flavor_providers.dart';
import 'src/client/presentation/client_providers.dart';
import 'src/my_app.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
      overrides: [
        flavorConfigProvider.overrideWithValue(FlavorConfig(AppFlavor.dev)),
        backendUrlProvider.overrideWithValue(
          Platform.isIOS ? 'http://localhost:1337' : 'http://10.0.2.2:1337',
        ),
      ],
    ),
  );
}
