import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../config/route.dart';

class VisitorTypeScreen extends StatefulWidget {
  const VisitorTypeScreen({super.key});

  @override
  State<VisitorTypeScreen> createState() => _VisitorTypeScreenState();
}

class _VisitorTypeScreenState extends State<VisitorTypeScreen> {
  String _selectedType = 'domestic'; // 'domestic' or 'international'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'River Buzz',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              
              Text(
                'Are you visiting from?',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              
              Text(
                'Help us customize your spiritual journey.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.onSurface.withOpacity(0.6),
                    ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 48),
              
              Row(
                children: [
                  Expanded(
                    child: _buildVisitorCard(
                      title: 'Indian User',
                      subtitle: 'Domestic',
                      iconData: Icons.temple_hindu,
                      value: 'domestic',
                      iconColor: AppColors.secondaryContainer,
                      iconBgColor: AppColors.secondaryContainer.withOpacity(0.1),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildVisitorCard(
                      title: 'Foreigner',
                      subtitle: 'International',
                      iconData: Icons.public,
                      value: 'international',
                      iconColor: AppColors.primaryContainer,
                      iconBgColor: AppColors.surfaceContainerHighest,
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                },
                child: Text(
                  'Skip for now',
                  style: TextStyle(
                    color: AppColors.onSurface.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVisitorCard({
    required String title,
    required String subtitle,
    required IconData iconData,
    required String value,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    final bool isSelected = _selectedType == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedType = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : AppColors.surfaceBright,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppColors.secondaryContainer : AppColors.surfaceContainerHighest,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? []
              : [
                  BoxShadow(
                    color: AppColors.onSurface.withOpacity(0.04),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  )
                ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    iconData,
                    size: 40,
                    color: iconColor,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.onSurface.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: -16,
                right: -4,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.secondaryContainer,
                    size: 24,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
