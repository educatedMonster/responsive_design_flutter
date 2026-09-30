import 'package:flutter/material.dart';

import 'responsive_builder.dart';
import 'responsive_value.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;

  /// Used when using FixedCrossAxisCount
  final ResponsiveValue<int>? columns;

  /// Used when using MaxCrossAxisExtent
  final ResponsiveValue<double>? maxCrossAxisExtent;
  final ResponsiveValue<double> padding;
  final ResponsiveValue<double> spacing;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.columns,
    this.maxCrossAxisExtent,
    this.padding = const ResponsiveValue<double>(
      mobile: 16,
      tablet: 24,
      desktop: 32,
    ),
    this.spacing = const ResponsiveValue<double>(
      mobile: 12,
      tablet: 16,
      desktop: 20,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, responsive) {
        return GridView.builder(
          padding: EdgeInsets.all(padding.get(context, responsive)),
          gridDelegate: _gridDelegate(context, responsive),
          itemCount: children.length,
          itemBuilder: (context, index) {
            return children[index];
          },
        );
      },
    );
  }

  SliverGridDelegate _gridDelegate(BuildContext context, dynamic responsive) {
    final itemSpacing = spacing.get(context, responsive);

    if (maxCrossAxisExtent != null) {
      return SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent!.get(context, responsive),
        crossAxisSpacing: itemSpacing,
        mainAxisSpacing: itemSpacing,
      );
    }

    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: columns?.get(context, responsive) ?? 1,
      crossAxisSpacing: itemSpacing,
      mainAxisSpacing: itemSpacing,
    );
  }
}
