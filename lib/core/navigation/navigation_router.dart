import 'package:flutter/material.dart';

import '../../features/dashboard/dashboard_page.dart';
import '../../features/properties/properties_page.dart';
import '../../features/pos/pos_page.dart';
import '../../features/reports/reports_page.dart';
import '../../features/settings/settings_page.dart';

class NavigationRouter {
  static Widget page(int index) {
    switch (index) {
      case 1:
        return const PropertiesPage();

      case 2:
        return const PosPage();

      case 3:
        return const ReportsPage();

      case 4:
        return const SettingsPage();

      default:
        return const DashboardPage();
    }
  }
}
