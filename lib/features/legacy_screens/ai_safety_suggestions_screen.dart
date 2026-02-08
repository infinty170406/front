import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class AiSafetySuggestionsScreen extends StatefulWidget {
  const AiSafetySuggestionsScreen({super.key});

  @override
  State<AiSafetySuggestionsScreen> createState() =>
      _AiSafetySuggestionsScreenState();
}

class _AiSafetySuggestionsScreenState extends State<AiSafetySuggestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Safety Suggestions'),
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
                'AI Insights',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Based on recent activity, here are some ways to improve Leo\'s safety.',
                style: TextStyle(fontSize: 16, color: AppColors.textSub),
              ),
              const SizedBox(height: 32),
              _buildSuggestionCard(
                title: 'New Safe Zone?',
                description:
                    'Leo has spent over 2 hours at "Springfield Mall" three times this week. Should we add it as a Safe Zone?',
                action: 'Add Zone',
                onAction: () {},
                icon: Icons.add_location_alt,
              ),
              const SizedBox(height: 16),
              _buildSuggestionCard(
                title: 'App Filtering',
                description:
                    'We detected frequent attempts to access unverified social media sites. Consider tightening the Content Filter.',
                action: 'Review Filter',
                onAction: () {},
                icon: Icons.security,
              ),
              const SizedBox(height: 16),
              _buildSuggestionCard(
                title: 'Safe Route Suggestion',
                description:
                    'The AI found a better-lit walking route for Leo\'s walk home from school.',
                action: 'View Route',
                onAction: () {},
                icon: Icons.map,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionCard({
    required String title,
    required String description,
    required String action,
    required VoidCallback onAction,
    required IconData icon,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.primary),
                const SizedBox(width: 12),
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            const SizedBox(height: 16),
            Text(description,
                style: const TextStyle(color: AppColors.textSub, height: 1.5)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onAction,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(action),
            ),
          ],
        ),
      ),
    );
  }
}
