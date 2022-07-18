import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingSkeleton extends StatelessWidget {
  final double? radius;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const LoadingSkeleton({
    super.key,
    this.radius,
    this.width,
    this.height,
    this.padding,
    this.margin,
  });

  /// Circular shape shimmer skeleton.
  factory LoadingSkeleton.circle(double radius) => LoadingSkeleton(
        radius: radius,
        width: radius * 2.0,
        height: radius * 2.0,
      );

  /// Rectangular shimmer skeleton.
  factory LoadingSkeleton.rectangle({
    required double width,
    required double height,
    double radius = 0.0,
    EdgeInsets margin = EdgeInsets.zero,
    EdgeInsets padding = EdgeInsets.zero,
  }) =>
      LoadingSkeleton(
        radius: radius,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
      );

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        decoration: radius == null
            ? null
            : BoxDecoration(borderRadius: BorderRadius.circular(radius!)),
      ),
      gradient: const LinearGradient(colors: [Colors.black, Colors.grey]),
    );
  }
}
