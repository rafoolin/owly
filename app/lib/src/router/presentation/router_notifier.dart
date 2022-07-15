import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nhost_sdk/nhost_sdk.dart';

import '../../features/authentication/presentation/auth_providers.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AuthenticationState?>(
      authenticationStateProvider,
      (_, __) => notifyListeners(),
    );
  }
}
