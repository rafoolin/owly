import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/flavor_config.dart';

final flavorConfigProvider = Provider<FlavorConfig>(
  (_) => FlavorConfig(AppFlavor.paid),
);
