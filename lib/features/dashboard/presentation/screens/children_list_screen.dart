import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/children_provider.dart';

class ChildrenListScreen extends ConsumerWidget {
  const ChildrenListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Mes Enfants'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textMain,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/link-child'),
          ),
        ],
      ),
      body: childrenAsync.when(
        data: (children) => RefreshIndicator(
          onRefresh: () => ref.refresh(childrenProvider.future),
          child: children.isEmpty
              ? _buildEmptyState(context)
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: children.length,
                  itemBuilder: (context, index) {
                    final child = children[index];
                    return _buildChildCard(context, child);
                  },
                ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Erreur: $err')),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.child_care, size: 64, color: AppColors.gray400),
          const SizedBox(height: 16),
          const Text('Aucun enfant lié',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Liez un appareil pour commencer le suivi.',
              style: TextStyle(color: AppColors.textSub)),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/link-child'),
            child: const Text('Lier un enfant'),
          ),
        ],
      ),
    );
  }

  Widget _buildChildCard(BuildContext context, dynamic child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(0.1),
          child: Text(child.displayName[0],
              style: const TextStyle(color: AppColors.primary)),
        ),
        title: Text(child.displayName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle:
            Text(child.deviceStatus == 'ONLINE' ? 'En ligne' : 'Hors ligne'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.pushNamed(context, '/child-dashboard',
            arguments: child.childId),
      ),
    );
  }
}
