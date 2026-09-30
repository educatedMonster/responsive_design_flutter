class ResponsiveBreakpoints {
  static const mobile = 600.0;
  static const tablet = 1200.0;

  static bool isMobile(double width) => width < mobile;

  static bool isTablet(double width) => width >= mobile && width < tablet;

  static bool isDesktop(double width) => width >= tablet;
}
