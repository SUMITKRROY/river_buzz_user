import 'package:flutter/material.dart';
import 'config/theam_data.dart';
import 'config/route.dart';

void main() {
  runApp(const RiverBuzzApp());
}

class RiverBuzzApp extends StatelessWidget {
  const RiverBuzzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'River Buzz',
      debugShowCheckedModeBanner: false,
      // Injecting our High-End Editorial System
      theme: AppTheme.etherealFlowTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
