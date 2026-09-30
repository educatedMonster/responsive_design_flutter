import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/navigation/app_shell.dart';
import 'core/navigation/navigation_provider.dart';

void main() {
  runApp(const ResponsiveDesignFlutter());
}

class ResponsiveDesignFlutter extends StatelessWidget {
  const ResponsiveDesignFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NavigationProvider())],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: AppShell()),
    );
  }
}
