import 'package:flutter/material.dart';

import 'responsive.dart';

class ResponsiveValue<T> {
  final T mobile;
  final T? mobileLandscape;
  final T? tablet;
  final T? tabletLandscape;
  final T? desktop;

  const ResponsiveValue({
    required this.mobile,
    this.mobileLandscape,
    this.tablet,
    this.tabletLandscape,
    this.desktop,
  });

  T get(BuildContext context, Responsive responsive) {
    if (responsive.isDesktop && desktop != null) {
      return desktop!;
    }

    if (responsive.isTabletLandscape && tabletLandscape != null) {
      return tabletLandscape!;
    }

    if (responsive.isTabletPortrait && tablet != null) {
      return tablet!;
    }

    if (responsive.isMobileLandscape && mobileLandscape != null) {
      return mobileLandscape!;
    }

    return mobile;
  }
}
