import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../parental_control/presentation/providers/parental_control_provider.dart';

class ChildDashboardScreen extends ConsumerWidget {
  final String childId;
  const ChildDashboardScreen({super.key, required this.childId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(parentalProfileProvider(childId));

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Tableau de Bord'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textMain,
        elevation: 0,
      ),
      body: profileAsync.when(
        data: (aggregate) => SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildStatusCard(aggregate),
              const SizedBox(height: 24),
              const Text('Contrôles Rapides',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildShortcutGrid(context),
              const SizedBox(height: 24),
              const Text('Activité Récente',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildRecentActivityShortcut(context),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Erreur: $err')),
      ),
    );
  }

  Widget _buildStatusCard(dynamic aggregate) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Mode Actuel',
                    style: TextStyle(color: AppColors.textSub)),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    aggregate.profile.mode.toString().split('.').last,
                    style: const TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatusItem(
                    Icons.timer, '${aggregate.scheduleRules.length} Planning'),
                _buildStatusItem(
                    Icons.shield, '${aggregate.contentRules.length} Filtres'),
                _buildStatusItem(
                    Icons.abc, '${aggregate.blockedKeywords.length} Mots'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(fontSize: 12, color: AppColors.textSub)),
      ],
    );
  }

  Widget _buildShortcutGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildShortcutItem(
            context,
            'Horaires',
            Icons.schedule,
            AppColors.secondary,
            () =>
                Navigator.pushNamed(context, '/schedules', arguments: childId)),
        _buildShortcutItem(
            context,
            'Contenu',
            Icons.security,
            Colors.orange,
            () => Navigator.pushNamed(context, '/content-rules',
                arguments: childId)),
        _buildShortcutItem(
            context,
            'Mots-clés',
            Icons.text_fields,
            Colors.blue,
            () =>
                Navigator.pushNamed(context, '/keywords', arguments: childId)),
        _buildShortcutItem(
            context,
            'Profil',
            Icons.person,
            Colors.green,
            () => Navigator.pushNamed(context, '/child-settings',
                arguments: childId)),
      ],
    );
  }

  Widget _buildShortcutItem(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivityShortcut(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.history, color: AppColors.primary),
        title: const Text('Voir tout l\'historique'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () =>
            Navigator.pushNamed(context, '/activity-logs', arguments: childId),
      ),
    );
  }
}
