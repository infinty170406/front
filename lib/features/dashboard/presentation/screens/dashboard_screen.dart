import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../routes.dart';
import '../providers/children_provider.dart';

class MultiChildDashboardScreen extends ConsumerStatefulWidget {
  const MultiChildDashboardScreen({super.key});

  @override
  ConsumerState<MultiChildDashboardScreen> createState() => _MultiChildDashboardScreenState();
}

class _MultiChildDashboardScreenState extends ConsumerState<MultiChildDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final children = ref.watch(childrenProvider);
    final selectedId = ref.watch(selectedChildIdProvider);
    
    // Safety check if no children
    if (children.isEmpty) {
      return const Scaffold(body: Center(child: Text("No children found"))); // or redirect
    }

    final selectedChild = children.firstWhere(
      (c) => c.id == selectedId,
      orElse: () => children.first,
    );

    return Scaffold(
      backgroundColor: AppTheme.surfaceWhite,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(children, selectedId),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildStatusCard(selectedChild),
                    const SizedBox(height: 24),
                    Text('Activités Récentes', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 16),
                    _buildActivityItem('YouTube', '2h 15m', Icons.play_circle_fill, Colors.red),
                    _buildActivityItem('Roblox', '45m', Icons.games, Colors.blue),
                    _buildActivityItem('Instagram', '30m', Icons.camera_alt, Colors.purple),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppTheme.primaryBlue,
        unselectedItemColor: AppTheme.textGrey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.rule_rounded), label: 'Règles'),
          BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: 'Localisation'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Réglages'),
        ],
      ),
    );
  }

  Widget _buildHeader(List<Child> children, String? selectedId) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
        boxShadow: [
           BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('The Guardian', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 20)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: children.length + 1,
              itemBuilder: (context, index) {
                if (index == children.length) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                         CircleAvatar(
                           radius: 30,
                           backgroundColor: Colors.grey[100],
                           child: IconButton(
                             icon: const Icon(Icons.add, color: AppTheme.primaryBlue),
                             onPressed: () {
                               Navigator.pushNamed(context, AppRoutes.createChildProfile);
                             },
                           ),
                         ),
                         const SizedBox(height: 8),
                         const Text('Ajouter', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                }
                final child = children[index];
                final isSelected = child.id == selectedId || (selectedId == null && index == 0);
                
                return GestureDetector(
                  onTap: () {
                     ref.read(selectedChildIdProvider.notifier).state = child.id;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? AppTheme.primaryBlue : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: AppTheme.primaryBlue.withOpacity(0.1),
                            child: Text(
                              child.name[0],
                              style: const TextStyle(
                                color: AppTheme.primaryBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          child.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? AppTheme.textDark : AppTheme.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(Child child) {
    return FadeInUp(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
             BoxShadow(color: AppTheme.primaryBlue.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Statut',
                      style: GoogleFonts.inter(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.shield, color: AppTheme.accentCyan, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Protégé',
                          style: GoogleFonts.outfit(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Temps réel', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 24),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStat('Temps d\'écran', '1h 45m', Icons.timer),
                _buildStat('Alertes', '0', Icons.notifications_off),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 16),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ],
    );
  }

  Widget _buildActivityItem(String name, String time, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Aujourd\'hui'),
        trailing: Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
