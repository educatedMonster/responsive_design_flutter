import 'package:flutter/material.dart';

import '../../core/responsive/responsive_grid.dart';
import '../../core/responsive/responsive_value.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
      //   mobile: 360,
      //   tablet: 340,
      //   desktop: 300,
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

      children: [
        for (int i = 1; i <= 10; i++)
          LayoutBuilder(
            builder: (context, constraints) {
              return AspectRatio(
                aspectRatio: 1.6,
                child: Card(
                  child: Center(
                    child: Text(
                      'Property $i',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
