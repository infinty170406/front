import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class StrictModeConfigurationScreen extends StatefulWidget {
  const StrictModeConfigurationScreen({super.key});

  @override
  State<StrictModeConfigurationScreen> createState() =>
      _StrictModeConfigurationScreenState();
}

class _StrictModeConfigurationScreenState
    extends State<StrictModeConfigurationScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Strict Mode'),
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
                  'Focus Time',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Perfect for exam periods or grounding. This locks all non-essential apps instantly, keeping only the essentials active.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                _buildActionCard(
                  title: 'Activate Now',
                  subtitle: 'Immediately restrict app access',
                  icon: Icons.bolt,
                  onTap: () {},
                ),
                const SizedBox(height: 32),
                const Text(
                  'Always Allowed',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildAppIcon(Icons.phone, 'Phone'),
                      const SizedBox(width: 16),
                      _buildAppIcon(Icons.message, 'Messages'),
                      const SizedBox(width: 16),
                      _buildAppIcon(Icons.map, 'Maps'),
                      const SizedBox(width: 16),
                      _buildAppIcon(Icons.calculate, 'Calc'),
                      const SizedBox(width: 16),
                      _buildAddAppIcon(),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Automation',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildAutomationCard(),
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
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Save Changes'),
                      SizedBox(width: 8),
                      Icon(Icons.save),
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

  Widget _buildActionCard(
      {required String title,
      required String subtitle,
      required IconData icon,
      required VoidCallback onTap}) {
    return Card(
      elevation: 0,
      color: AppColors.gray100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                          fontSize: 14.0, color: AppColors.textSub),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: AppColors.gray200,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.gray700),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildAddAppIcon() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray400),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.add, color: AppColors.gray500),
        ),
        const SizedBox(height: 8),
        const Text('Add App', style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildAutomationCard() {
    return Card(
      elevation: 0,
      color: AppColors.gray100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.schedule, color: AppColors.primary),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scheduled Activation',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text('Automatically turn on daily'),
                    ],
                  ),
                ),
                Switch(value: false, onChanged: (v) {}),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'].map((day) {
                return CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    day[0],
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
