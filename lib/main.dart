import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/theam_data.dart';
import 'config/route.dart';

void main() {
  runApp(const RiverBuzzApp());
}

class RiverBuzzApp extends StatelessWidget {
  const RiverBuzzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X base design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'River Buzz',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.etherealFlowTheme,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}