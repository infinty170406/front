import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class AiAssistantGuideScreen extends StatefulWidget {
  const AiAssistantGuideScreen({super.key});

  @override
  State<AiAssistantGuideScreen> createState() => _AiAssistantGuideScreenState();
}

class _AiAssistantGuideScreenState extends State<AiAssistantGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('AI Assistant Guide'),
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
                'How to use your AI Assistant',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'The Guardian AI is designed to help you balance safety and freedom for your child. Here are some ways it helps you:',
                style: TextStyle(
                    fontSize: 16, color: AppColors.textSub, height: 1.5),
              ),
              const SizedBox(height: 32),
              _buildGuideSection(
                title: 'Smart Recommendations',
                description:
                    'The AI learns your child\'s habits and suggests rule adjustments that make sense.',
                icon: Icons.auto_awesome,
              ),
              const SizedBox(height: 24),
              _buildGuideSection(
                title: 'Safety Alerts',
                description:
                    'If Leo leaves a safe zone, the AI immediately notifies you and starts high-accuracy tracking.',
                icon: Icons.security,
              ),
              const SizedBox(height: 24),
              _buildGuideSection(
                title: 'Automated Scheduling',
                description:
                    'Set complex schedules easily with AI-assisted focus modes and bedtime routines.',
                icon: Icons.schedule,
              ),
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
                child: const Text('Got it!'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuideSection(
      {required String title,
      required String description,
      required IconData icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 4),
              Text(description,
                  style:
                      const TextStyle(color: AppColors.textSub, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}
