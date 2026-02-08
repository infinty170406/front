import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class WeeklyActivityReportScreen extends StatefulWidget {
  const WeeklyActivityReportScreen({super.key});

  @override
  State<WeeklyActivityReportScreen> createState() =>
      _WeeklyActivityReportScreenState();
}

class _WeeklyActivityReportScreenState
    extends State<WeeklyActivityReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Weekly Activity'),
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
              _buildMetricCard(
                title: 'Total Screen Time',
                value: '4h 32m',
                difference: '-15% from last week',
                isGood: true,
                icon: Icons.timer,
                color: AppColors.primary,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Pickups',
                      value: '42',
                      difference: '+5%',
                      isGood: false,
                      icon: Icons.touch_app,
                      color: AppColors.info,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Notifications',
                      value: '128',
                      difference: '-2%',
                      isGood: true,
                      icon: Icons.notifications,
                      color: AppColors.success,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Most Used Apps',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 16),
              _buildAppUsageTile('Minecraft', '2h 15m', 0.6, Colors.green),
              _buildAppUsageTile('YouTube', '1h 45m', 0.4, Colors.red),
              _buildAppUsageTile('TikTok', '45m', 0.2, Colors.black),
              const SizedBox(height: 24),
              const Text(
                'Category Breakdown',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 16),
              _buildCategoryChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String difference,
    required bool isGood,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 16),
            Text(title,
                style: const TextStyle(color: AppColors.textSub, fontSize: 14)),
            const SizedBox(height: 4),
            Text(value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isGood ? Icons.arrow_downward : Icons.arrow_upward,
                  size: 16,
                  color: isGood ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 4),
                Text(
                  difference,
                  style: TextStyle(
                    color: isGood ? Colors.green : Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppUsageTile(
      String appName, String time, double progress, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.apps, color: Colors.grey),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(appName,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text(time,
                        style: const TextStyle(
                            color: AppColors.textSub, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: AppColors.gray200,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChart() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text('Distribution Chart Placeholder',
            style: TextStyle(color: AppColors.textSub)),
      ),
    );
  }
}
