import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ParentAppSettingsScreen extends StatefulWidget {
  const ParentAppSettingsScreen({super.key});

  @override
  State<ParentAppSettingsScreen> createState() =>
      _ParentAppSettingsScreenState();
}

class _ParentAppSettingsScreenState extends State<ParentAppSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppColors.textSub,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingTile(
              title: 'My Profile',
              icon: Icons.person_outline,
              onTap: () {},
            ),
            _buildSettingTile(
              title: 'Add another Guardian',
              icon: Icons.group_add_outlined,
              onTap: () {},
            ),
            _buildSettingTile(
              title: 'Subscription',
              icon: Icons.star_outline,
              onTap: () {},
            ),
            const SizedBox(height: 32),
            const Text(
              'Security',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppColors.textSub,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingTile(
              title: 'Change PIN',
              icon: Icons.lock_outline,
              onTap: () {},
            ),
            _buildSettingTile(
              title: 'Face ID / Touch ID',
              icon: Icons.fingerprint,
              trailing: Switch(value: true, onChanged: (v) {}),
            ),
            const SizedBox(height: 32),
            const Text(
              'Support',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppColors.textSub,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingTile(
              title: 'Help Center',
              icon: Icons.help_outline,
              onTap: () {},
            ),
            _buildSettingTile(
              title: 'About The Guardian',
              icon: Icons.info_outline,
              subtitle: 'v2.0.1',
              onTap: () {},
            ),
            const SizedBox(height: 32),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.error,
                side: const BorderSide(color: AppColors.error),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required String title,
    required IconData icon,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.gray700),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: trailing ??
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
