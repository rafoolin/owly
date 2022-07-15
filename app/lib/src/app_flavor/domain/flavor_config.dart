import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flavor_config.freezed.dart';

enum AppFlavor {
  dev('Dev'),
  free('Free'),
  paid('Paid');

  final String type;
  const AppFlavor(this.type);

  Color get color {
    switch (this) {
      case AppFlavor.free:
        return const Color(0xFFFFFF89);
      case AppFlavor.dev:
        return const Color(0xFFE4EAE6);
      case AppFlavor.paid:
      default:
        return Colors.transparent;
    }
  }

  String get asset => 'assets/logo/${type.toLowerCase()}.png';
}

@freezed
class FlavorConfig with _$FlavorConfig {
  factory FlavorConfig(AppFlavor flavor) = _FlavorConfig;
}
