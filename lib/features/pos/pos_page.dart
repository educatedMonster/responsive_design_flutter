import 'package:flutter/material.dart';

import '../../core/responsive/responsive_grid.dart';
import '../../core/responsive/responsive_value.dart';

import 'widgets/pos_card.dart';

class PosPage extends StatelessWidget {
  const PosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGrid(
      columns: const ResponsiveValue<int>(
        mobile: 1,
        mobileLandscape: 2,
        tablet: 3,
        tabletLandscape: 4,
        desktop: 6,
      ),

      // maxCrossAxisExtent: const ResponsiveValue<double>(
      //   mobile: 300,
      //   tablet: 320,
      //   desktop: 360,
      // ),
      padding: const ResponsiveValue<double>(
        mobile: 12,
        tablet: 20,
        desktop: 32,
      ),

      spacing: const ResponsiveValue<double>(
        mobile: 12,
        tablet: 16,
        desktop: 20,
      ),

      children: [for (int i = 1; i <= 8; i++) PosCard(title: "Order $i")],
    );
  }
}
