import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drop_prototype/core/theme/app_theme.dart';
import 'package:drop_prototype/core/router/app_router.dart';
import 'package:drop_prototype/core/constants/app_constants.dart';

/// Entry point for the Drop Prototype application
///
/// This app demonstrates Clean Architecture principles with:
/// - Riverpod for state management
/// - GoRouter for type-safe navigation
/// - Material 3 design system
/// - Feature-first folder organization
void main() {
  // Wrap app with ProviderScope for Riverpod
  runApp(
    const ProviderScope(
      child: DropApp(),
    ),
  );
}

/// Root application widget
class DropApp extends StatelessWidget {
  const DropApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // App Configuration
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,

      // Theme Configuration (Material 3)
      theme: AppTheme.lightTheme,

      // Router Configuration (GoRouter)
      routerConfig: appRouter,
    );
  }
}
