import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class AdvancedActivityAnalyticsScreen extends StatefulWidget {
  const AdvancedActivityAnalyticsScreen({super.key});

  @override
  State<AdvancedActivityAnalyticsScreen> createState() =>
      _AdvancedActivityAnalyticsScreenState();
}

class _AdvancedActivityAnalyticsScreenState
    extends State<AdvancedActivityAnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Activity Analytics'),
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
                'Usage Trends',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text('Analytics Chart Placeholder',
                      style: TextStyle(color: AppColors.textSub)),
                ),
              ),
              const SizedBox(height: 24),
              _buildInsightCard(
                title: 'Education vs Entertainment',
                content:
                    'Leo spent 45% more time on educational apps this week compared to last week. Great progress!',
                icon: Icons.lightbulb_outline,
              ),
              const SizedBox(height: 16),
              _buildInsightCard(
                title: 'Bedtime Consistency',
                content:
                    'Leo followed his bedtime schedule 6 out of 7 days. Consistency is key for good sleep.',
                icon: Icons.bedtime,
              ),
              const SizedBox(height: 32),
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
                child: const Text('Download Full Report (PDF)'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInsightCard(
      {required String title,
      required String content,
      required IconData icon}) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
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
                  const SizedBox(height: 8),
                  Text(content,
                      style: const TextStyle(
                          color: AppColors.textSub, height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
