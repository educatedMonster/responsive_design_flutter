import 'package:flutter/material.dart';

import 'navigation_type.dart';
import 'responsive_scaffold.dart';

class ResponsiveNavigation {
  static Widget mobile({
    required MobileNavigationType type,
    required List<ResponsiveNavigationItem> items,
    required int selectedIndex,
    required ValueChanged<int>? onChanged,
  }) {
    switch (type) {
      case MobileNavigationType.drawer:
        return _drawer(items, selectedIndex, onChanged);

      case MobileNavigationType.bottomBar:
        return NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: onChanged,
          destinations: items
              .map(
                (item) => NavigationDestination(
                  icon: Icon(item.icon),
                  label: item.label,
                ),
              )
              .toList(),
        );
    }
  }

  static Widget tablet({
    required TabletNavigationType type,
    required List<ResponsiveNavigationItem> items,
    required int selectedIndex,
    required ValueChanged<int>? onChanged,
  }) {
    return NavigationRail(
      extended: type == TabletNavigationType.extendedRail,
      selectedIndex: selectedIndex,
      onDestinationSelected: onChanged,
      destinations: items
          .map(
            (item) => NavigationRailDestination(
              icon: Icon(item.icon),
              label: Text(item.label),
            ),
          )
          .toList(),
    );
  }

  static Widget desktop({
    required DesktopNavigationType type,
    required List<ResponsiveNavigationItem> items,
    required int selectedIndex,
    required ValueChanged<int>? onChanged,
  }) {
    switch (type) {
      case DesktopNavigationType.drawer:
        return NavigationDrawer(
          selectedIndex: selectedIndex,
          onDestinationSelected: onChanged,
          children: items
              .map(
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.label),
                ),
              )
              .toList(),
        );

      case DesktopNavigationType.rail:
        return NavigationRail(
          selectedIndex: selectedIndex,
          onDestinationSelected: onChanged,
          destinations: items
              .map(
                (item) => NavigationRailDestination(
                  icon: Icon(item.icon),
                  label: Text(item.label),
                ),
              )
              .toList(),
        );

      case DesktopNavigationType.extendedRail:
        return NavigationRail(
          extended: true,
          selectedIndex: selectedIndex,
          onDestinationSelected: onChanged,
          destinations: items
              .map(
                (item) => NavigationRailDestination(
                  icon: Icon(item.icon),
                  label: Text(item.label),
                ),
              )
              .toList(),
        );
    }
  }

  static Widget _drawer(
    List<ResponsiveNavigationItem> items,
    int selectedIndex,
    ValueChanged<int>? onChanged,
  ) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: onChanged,
      children: items
          .map(
            (item) => NavigationDrawerDestination(
              icon: Icon(item.icon),
              label: Text(item.label),
            ),
          )
          .toList(),
    );
  }
}
