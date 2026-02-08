import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class LockScreenSafetyNotificationScreen extends StatefulWidget {
  const LockScreenSafetyNotificationScreen({super.key});

  @override
  State<LockScreenSafetyNotificationScreen> createState() =>
      _LockScreenSafetyNotificationScreenState();
}

class _LockScreenSafetyNotificationScreenState
    extends State<LockScreenSafetyNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?q=80&w=1587&auto=format&fit=crop'), // Placeholder wallpaper
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Column(
                  children: [
                    Icon(Icons.lock_outline, color: Colors.white, size: 24),
                    SizedBox(height: 8),
                    Text(
                      '09:41',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Tuesday, September 12',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: AppColors.error,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.shield,
                                color: Colors.white, size: 16),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'The Guardian',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Text(
                                'now',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '⚠️ Safety Alert: Leo has left the "School" Safe Zone',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Tap to see his current location',
                        style: TextStyle(color: AppColors.textSub),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60), // Space for bottom swipe indicator
            ],
          ),
        ),
      ),
    );
  }
}
