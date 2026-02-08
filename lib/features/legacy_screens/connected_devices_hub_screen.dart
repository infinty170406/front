import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ConnectedDevicesHubScreen extends StatefulWidget {
  const ConnectedDevicesHubScreen({super.key});

  @override
  State<ConnectedDevicesHubScreen> createState() =>
      _ConnectedDevicesHubScreenState();
}

class _ConnectedDevicesHubScreenState extends State<ConnectedDevicesHubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('My Devices'),
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
                'Linked Devices',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Manage all devices connected to The Guardian.',
                style: TextStyle(fontSize: 16, color: AppColors.textSub),
              ),
              const SizedBox(height: 32),
              _buildDeviceCard(
                name: 'Leo\'s iPhone 13',
                status: 'Connected',
                lastSeen: 'Active now',
                icon: Icons.phone_iphone,
                isOnline: true,
              ),
              const SizedBox(height: 16),
              _buildDeviceCard(
                name: 'Leo\'s iPad Air',
                status: 'Offline',
                lastSeen: 'Seen 2h ago',
                icon: Icons.tablet_mac,
                isOnline: false,
              ),
              const SizedBox(height: 16),
              _buildDeviceCard(
                name: 'Family Nest Hub',
                status: 'Connected',
                lastSeen: 'Active now',
                icon: Icons.home,
                isOnline: true,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add New Device'),
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

  Widget _buildDeviceCard({
    required String name,
    required String status,
    required String lastSeen,
    required IconData icon,
    required bool isOnline,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.gray700),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isOnline ? AppColors.success : AppColors.gray400,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text('$status • $lastSeen', style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
