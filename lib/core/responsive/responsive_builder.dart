import 'package:flutter/material.dart';

import 'responsive.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, Responsive responsive) builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final responsive = Responsive(context, orientation: orientation);

        return builder(context, responsive);
      },
    );
  }
}
