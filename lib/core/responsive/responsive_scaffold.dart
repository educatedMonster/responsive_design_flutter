import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/navigation_provider.dart';
import 'navigation_type.dart';
import 'responsive_builder.dart';
import 'responsive_navigation.dart';

class ResponsiveNavigationItem {
  final String label;
  final IconData icon;

  const ResponsiveNavigationItem({required this.label, required this.icon});
}

class ResponsiveScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<ResponsiveNavigationItem> items;
  final MobileNavigationType mobileNavigation;
  final TabletNavigationType tabletNavigation;
  final DesktopNavigationType desktopNavigation;

  const ResponsiveScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.items,
    this.mobileNavigation = MobileNavigationType.bottomBar,
    this.tabletNavigation = TabletNavigationType.rail,
    this.desktopNavigation = DesktopNavigationType.drawer,
  });

  @override
  Widget build(BuildContext context) {
    final navigation = context.watch<NavigationProvider>();
    final selectedIndex = navigation.selectedIndex;

    return ResponsiveBuilder(
      builder: (context, responsive) {
        if (responsive.isMobile) {
          return _mobileLayout(context, selectedIndex);
        }

        if (responsive.isTablet) {
          return _tabletLayout(context, selectedIndex);
        }

        return _desktopLayout(context, selectedIndex);
      },
    );
  }

  Widget _mobileLayout(BuildContext context, int selectedIndex) {
    final navigation = ResponsiveNavigation.mobile(
      type: mobileNavigation,

      items: items,

      selectedIndex: selectedIndex,

      onChanged: (index) {
        context.read<NavigationProvider>().setIndex(index);
      },
    );

    if (mobileNavigation == MobileNavigationType.drawer) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),

        drawer: Drawer(child: navigation),

        body: body,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: body,

      bottomNavigationBar: navigation,
    );
  }

  Widget _tabletLayout(BuildContext context, int selectedIndex) {
    return Scaffold(
      body: Row(
        children: [
          ResponsiveNavigation.tablet(
            type: tabletNavigation,

            items: items,

            selectedIndex: selectedIndex,

            onChanged: (index) {
              context.read<NavigationProvider>().setIndex(index);
            },
          ),

          Expanded(child: _content()),
        ],
      ),
    );
  }

  Widget _desktopLayout(BuildContext context, int selectedIndex) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 280,

            child: ResponsiveNavigation.desktop(
              type: desktopNavigation,

              items: items,

              selectedIndex: selectedIndex,

              onChanged: (index) {
                context.read<NavigationProvider>().setIndex(index);
              },
            ),
          ),

          Expanded(child: _content()),
        ],
      ),
    );
  }

  Widget _content() {
    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: body,
    );
  }
}
