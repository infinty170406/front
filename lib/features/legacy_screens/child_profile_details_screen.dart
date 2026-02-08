import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ChildProfileDetailsScreen extends StatefulWidget {
  const ChildProfileDetailsScreen({super.key});

  @override
  State<ChildProfileDetailsScreen> createState() =>
      _ChildProfileDetailsScreenState();
}

class _ChildProfileDetailsScreenState extends State<ChildProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Leo\'s Profile'),
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
              const SizedBox(height: 16),
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary,
                  child: Text('L',
                      style: TextStyle(color: Colors.white, fontSize: 32)),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Leo',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMain,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Online now',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Screen Time',
                            style: TextStyle(color: AppColors.textSub)),
                        Icon(Icons.info_outline,
                            size: 16, color: AppColors.textSub),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1h 30m',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        Text('Left',
                            style: TextStyle(color: AppColors.textSub)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: 0.7,
                      backgroundColor: AppColors.gray200,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Active Rules',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 16),
              _buildRuleTile('Content Filter', 'Strict', Icons.shield),
              _buildRuleTile('Bedtime', '9:00 PM - 7:00 AM', Icons.bedtime),
              _buildRuleTile('App Limits', 'Focus Mode Active', Icons.timer),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text('Edit Rules'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRuleTile(String title, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.gray700),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(value, style: const TextStyle(color: AppColors.textSub)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.gray400),
        ],
      ),
    );
  }
}
