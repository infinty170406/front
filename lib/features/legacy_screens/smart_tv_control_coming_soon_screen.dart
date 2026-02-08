import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SmartTvControlComingSoonScreen extends StatefulWidget {
  const SmartTvControlComingSoonScreen({super.key});

  @override
  State<SmartTvControlComingSoonScreen> createState() =>
      _SmartTvControlComingSoonScreenState();
}

class _SmartTvControlComingSoonScreenState
    extends State<SmartTvControlComingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Text(
                  'Smart TV',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.textMainDark : AppColors.textMain,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.tv,
                    size: 64,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.help_outline, color: AppColors.gray400),
                      SizedBox(height: 8),
                      Text(
                        'Coming Soon',
                        style: TextStyle(
                          color: AppColors.gray500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Smart TV Limits',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                    color: isDark ? AppColors.textMainDark : AppColors.textMain,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Soon you will be able to set bedtime for the TV right from here. We are working hard to bring peace to your living room.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    color: isDark ? AppColors.textSubDark : AppColors.textSub,
                  ),
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Notify me when ready'),
                      SizedBox(width: 8),
                      Icon(Icons.notifications_outlined),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
