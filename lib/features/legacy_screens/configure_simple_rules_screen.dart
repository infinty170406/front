import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ConfigureSimpleRulesScreen extends StatefulWidget {
  const ConfigureSimpleRulesScreen({super.key});

  @override
  State<ConfigureSimpleRulesScreen> createState() =>
      _ConfigureSimpleRulesScreenState();
}

class _ConfigureSimpleRulesScreenState
    extends State<ConfigureSimpleRulesScreen> {
  bool _bedtimeEnabled = true;
  bool _appLimitsEnabled = true;
  bool _locationTrackingEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Quick Setup'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textMain,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Essential Rules',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enable the core safety features with one tap.',
                style: TextStyle(fontSize: 16, color: AppColors.textSub),
              ),
              const SizedBox(height: 32),
              _buildRuleToggle(
                title: 'Daily Bedtime',
                description: 'Pause device from 9:00 PM to 7:00 AM.',
                value: _bedtimeEnabled,
                onChanged: (v) => setState(() => _bedtimeEnabled = v),
                icon: Icons.bedtime,
              ),
              const SizedBox(height: 16),
              _buildRuleToggle(
                title: 'App Time Limits',
                description:
                    'Set a 2-hour daily limit for gaming and social media.',
                value: _appLimitsEnabled,
                onChanged: (v) => setState(() => _appLimitsEnabled = v),
                icon: Icons.timer,
              ),
              const SizedBox(height: 16),
              _buildRuleToggle(
                title: 'Location Tracking',
                description: 'Know where Leo is in real-time.',
                value: _locationTrackingEnabled,
                onChanged: (v) => setState(() => _locationTrackingEnabled = v),
                icon: Icons.location_on,
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Save & Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRuleToggle({
    required String title,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData icon,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(description,
                      style: const TextStyle(
                          color: AppColors.textSub, fontSize: 13, height: 1.4)),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
