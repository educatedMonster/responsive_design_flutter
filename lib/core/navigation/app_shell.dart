import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../responsive/responsive_scaffold.dart';
import '../responsive/navigation_type.dart';

import 'navigation_provider.dart';
import 'navigation_router.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = context.watch<NavigationProvider>();

    return ResponsiveScaffold(
      title: "Responsive Demo App",
      items: const [
        ResponsiveNavigationItem(label: "Dashboard", icon: Icons.dashboard),
        ResponsiveNavigationItem(label: "Properties", icon: Icons.hotel),
        ResponsiveNavigationItem(label: "POS", icon: Icons.point_of_sale),
        ResponsiveNavigationItem(label: "Reports", icon: Icons.analytics),
        ResponsiveNavigationItem(label: "Settings", icon: Icons.settings),
      ],
      mobileNavigation: MobileNavigationType.bottomBar,
      tabletNavigation: TabletNavigationType.rail,
      desktopNavigation: DesktopNavigationType.drawer,
      body: NavigationRouter.page(navigation.selectedIndex),
    );
  }
}
