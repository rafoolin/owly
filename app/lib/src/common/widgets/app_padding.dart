import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  final double? width;
  final double? height;
  const AppPadding({Key? key, this.width, this.height}) : super(key: key);

  /// Padding between widgets aligned horizontally
  ///
  /// Default value is multiplied by [flex].
  factory AppPadding.horizontal({int flex = 1}) =>
      AppPadding(width: 20.0 * flex);

  /// Padding between widgets aligned vertically
  ///
  /// Default value is multiplied by [flex].
  factory AppPadding.vertical({int flex = 1}) =>
      AppPadding(height: 20.0 * flex);

  /// Padding between several texts aligned horizontally
  ///
  /// Default value is multiplied by [flex].
  factory AppPadding.horizontalText({int flex = 1}) =>
      AppPadding(width: 10.0 * flex);

  /// Padding between several texts aligned vertically
  ///
  /// Default value is multiplied by [flex].
  factory AppPadding.verticalText({int flex = 1}) =>
      AppPadding(height: 10.0 * flex);

  /// Padding from the top
  ///
  /// Default value is multiplied by [flex].
  factory AppPadding.top({int flex = 1}) => AppPadding(height: 30.0 * flex);

  /// Padding from the top
  /// Default value is multiplied by [flex].
  factory AppPadding.bottom({int flex = 1}) => AppPadding(height: 30.0 * flex);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
