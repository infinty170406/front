import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ContentFilteringRulesScreen extends StatefulWidget {
  const ContentFilteringRulesScreen({super.key});

  @override
  State<ContentFilteringRulesScreen> createState() =>
      _ContentFilteringRulesScreenState();
}

class _ContentFilteringRulesScreenState
    extends State<ContentFilteringRulesScreen> {
  String _selectedLevel = 'Moderate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Content Filter'),
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
                'Filter Level',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Protect Leo from inappropriate content across the web.',
                style: TextStyle(fontSize: 16, color: AppColors.textSub),
              ),
              const SizedBox(height: 32),
              _buildFilterOption(
                level: 'Safe',
                description:
                    'Kid-friendly content only. All social media and video sharing blocked.',
              ),
              const SizedBox(height: 12),
              _buildFilterOption(
                level: 'Moderate',
                description:
                    'Filters explicit content. Most social media allowed with monitoring.',
              ),
              const SizedBox(height: 12),
              _buildFilterOption(
                level: 'Custom',
                description:
                    'You choose exactly what categories to block or allow.',
              ),
              const SizedBox(height: 32),
              const Text(
                'Specific Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildCategoryToggle('Adult Content', true),
              _buildCategoryToggle('Gambling', true),
              _buildCategoryToggle('Social Media', false),
              _buildCategoryToggle('Games', false),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Apply Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterOption(
      {required String level, required String description}) {
    final isSelected = _selectedLevel == level;
    return GestureDetector(
      onTap: () => setState(() => _selectedLevel = level),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(level,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 4),
                  Text(description,
                      style: const TextStyle(
                          color: AppColors.textSub, fontSize: 14, height: 1.4)),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryToggle(String title, bool initialValue) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Switch(
            value: initialValue,
            onChanged: (v) {},
            activeThumbColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
