import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class LocationHistoryTimelineScreen extends StatefulWidget {
  const LocationHistoryTimelineScreen({super.key});

  @override
  State<LocationHistoryTimelineScreen> createState() =>
      _LocationHistoryTimelineScreenState();
}

class _LocationHistoryTimelineScreenState
    extends State<LocationHistoryTimelineScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Location History'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildDateSelector(),
                const SizedBox(height: 24),
                _buildSummaryCard(),
                const SizedBox(height: 24),
                const Text(
                  'Activity Log',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildTimelineItem(
                  time: '8:00 AM',
                  title: 'Left home for school',
                  description: 'Walking • 15 mins',
                  icon: Icons.directions_walk,
                  isFirst: true,
                ),
                _buildTimelineItem(
                  time: '8:30 AM',
                  title: 'Arrived safely at School',
                  description: 'Stayed for 7h',
                  icon: Icons.school,
                ),
                _buildTimelineItem(
                  time: '4:00 PM',
                  title: 'Soccer Practice',
                  description: 'Driving • 30 mins',
                  icon: Icons.directions_car,
                ),
                _buildTimelineItem(
                  time: '5:00 PM',
                  title: 'Arrived Home',
                  description: 'Safe Zone: Home',
                  icon: Icons.home,
                  isLast: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final isSelected = index == 3;
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: isSelected ? Colors.transparent : AppColors.gray300),
            ),
            child: Center(
              child: Text(
                'Wed ${10 + index}',
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.gray600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Card(
      elevation: 0,
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
              child: const Icon(Icons.map, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Distance: 12 km',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('4 trips today'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View Route'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required String time,
    required String title,
    required String description,
    required IconData icon,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(time,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.gray500)),
          ),
          Column(
            children: [
              Container(
                width: 2,
                height: 20,
                color: isFirst ? Colors.transparent : AppColors.gray300,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 16, color: Colors.white),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: isLast ? Colors.transparent : AppColors.gray300,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(description,
                      style: const TextStyle(color: AppColors.gray500)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
