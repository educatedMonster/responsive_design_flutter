import 'package:flutter/material.dart';

import 'device_type.dart';
import 'responsive_breakpoints.dart';

class Responsive {
  final BuildContext context;

  final Orientation orientation;

  Responsive(this.context, {required this.orientation});

  Size get size => MediaQuery.sizeOf(context);

  double get width => size.width;

  DeviceType get deviceType {
    if (ResponsiveBreakpoints.isMobile(width)) {
      return DeviceType.mobile;
    }

    if (ResponsiveBreakpoints.isTablet(width)) {
      return DeviceType.tablet;
    }

    return DeviceType.desktop;
  }

  bool get isMobile => deviceType == DeviceType.mobile;

  bool get isTablet => deviceType == DeviceType.tablet;

  bool get isDesktop => deviceType == DeviceType.desktop;

  bool get isPortrait => orientation == Orientation.portrait;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isMobilePortrait => isMobile && isPortrait;

  bool get isMobileLandscape => isMobile && isLandscape;

  bool get isTabletPortrait => isTablet && isPortrait;

  bool get isTabletLandscape => isTablet && isLandscape;
}
