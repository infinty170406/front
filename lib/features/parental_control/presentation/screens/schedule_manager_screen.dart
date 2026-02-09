import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/parental_control_provider.dart';

class ScheduleManagerScreen extends ConsumerWidget {
  final String childId;
  const ScheduleManagerScreen({super.key, required this.childId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(parentalProfileProvider(childId));

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Gestion Horaires'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textMain,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddScheduleDialog(context, ref),
          ),
        ],
      ),
      body: profileAsync.when(
        data: (aggregate) => aggregate.scheduleRules.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: aggregate.scheduleRules.length,
                itemBuilder: (context, index) {
                  final rule = aggregate.scheduleRules[index];
                  return _buildScheduleCard(context, ref, rule);
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Erreur: $err')),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(child: Text('Aucun horaire configuré.'));
  }

  Widget _buildScheduleCard(BuildContext context, WidgetRef ref, dynamic rule) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text('${rule.startTime} - ${rule.endTime}',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(rule.daysOfWeek.join(', ')),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: rule.enabled,
              onChanged: (val) {
                // TODO: Update schedule
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteSchedule(context, ref, rule.scheduleId),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddScheduleDialog(BuildContext context, WidgetRef ref) {
    // Simplified add logic for now
  }

  void _deleteSchedule(
      BuildContext context, WidgetRef ref, String scheduleId) async {
    await ref
        .read(parentalControlRepositoryProvider)
        .deleteSchedule(childId, scheduleId);
    ref.invalidate(parentalProfileProvider(childId));
  }
}
