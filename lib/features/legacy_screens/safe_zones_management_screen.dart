import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SafeZonesManagementScreen extends StatefulWidget {
  const SafeZonesManagementScreen({super.key});

  @override
  State<SafeZonesManagementScreen> createState() =>
      _SafeZonesManagementScreenState();
}

class _SafeZonesManagementScreenState extends State<SafeZonesManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Safe Zones'),
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
                const SizedBox(height: 16),
                const Text(
                  'Manage Safe Zones',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Define areas where your child is safe. You will be alerted when they enter or leave these zones.',
                  style: TextStyle(fontSize: 16, color: AppColors.textSub),
                ),
                const SizedBox(height: 32),
                _buildZoneCard(
                  name: 'Home',
                  address: '123 Main St',
                  radius: '100m',
                  icon: Icons.home,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 16),
                _buildZoneCard(
                  name: 'School',
                  address: '456 School Ave',
                  radius: '200m',
                  icon: Icons.school,
                  color: AppColors.info,
                ),
                const SizedBox(height: 16),
                _buildZoneCard(
                  name: 'Grandma\'s House',
                  address: '789 Grandma Ln',
                  radius: '150m',
                  icon: Icons.favorite,
                  color: AppColors.warning,
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_location_alt),
                  label: const Text('Add New Safe Zone'),
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
      ),
    );
  }

  Widget _buildZoneCard({
    required String name,
    required String address,
    required String radius,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(address),
            Text('Radius: $radius',
                style: const TextStyle(fontSize: 12, color: AppColors.gray500)),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit_outlined),
          onPressed: () {},
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
