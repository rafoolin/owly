import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_flavor/presentation/app_flavor_providers.dart';

class AppLogo extends HookConsumerWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(flavorConfigProvider);

    return SizedBox(
      width: 200.0,
      height: 200.0,
      child: ExtendedImage(image: ExactAssetImage(state.flavor.asset)),
    );
  }
}
