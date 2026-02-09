import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/history_provider.dart';

class ActivityLogsScreen extends ConsumerWidget {
  final String childId;
  const ActivityLogsScreen({super.key, required this.childId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(historyProvider(childId));

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Journal d\'Activité'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textMain,
        elevation: 0,
      ),
      body: historyAsync.when(
        data: (events) => RefreshIndicator(
          onRefresh: () => ref.refresh(historyProvider(childId).future),
          child: events.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return _buildEventTile(event);
                  },
                ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Erreur: $err')),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 64, color: AppColors.gray400),
          SizedBox(height: 16),
          Text('Aucun événement',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('L\'activité de votre enfant apparaîtra ici.',
              style: TextStyle(color: AppColors.textSub)),
        ],
      ),
    );
  }

  Widget _buildEventTile(dynamic event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(event.type),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.readableMessage,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  DateFormat('dd/MM/yyyy HH:mm').format(event.occurredAt),
                  style:
                      const TextStyle(fontSize: 12, color: AppColors.textSub),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String type) {
    IconData icon;
    Color color;

    switch (type) {
      case 'CONTENT_BLOCKED':
        icon = Icons.block;
        color = Colors.red;
        break;
      case 'APP_BLOCKED':
        icon = Icons.app_blocking;
        color = Colors.orange;
        break;
      default:
        icon = Icons.info_outline;
        color = Colors.blue;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
