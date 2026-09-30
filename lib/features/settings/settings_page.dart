import 'package:flutter/material.dart';

import 'widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        SettingsTile(
          icon: Icons.person,
          title: "Profile",
          subtitle: "Manage your account information",
        ),

        SettingsTile(
          icon: Icons.notifications,
          title: "Notifications",
          subtitle: "Configure notification preferences",
        ),

        SettingsTile(
          icon: Icons.palette,
          title: "Appearance",
          subtitle: "Theme and display settings",
        ),

        SettingsTile(
          icon: Icons.security,
          title: "Security",
          subtitle: "Password and authentication settings",
        ),

        SettingsTile(
          icon: Icons.devices,
          title: "Devices",
          subtitle: "Manage logged-in devices",
        ),

        SettingsTile(
          icon: Icons.info,
          title: "About Zeus",
          subtitle: "Application information",
        ),
      ],
    );
  }
}
