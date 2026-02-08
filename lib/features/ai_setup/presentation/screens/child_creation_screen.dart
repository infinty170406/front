import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../routes.dart';

// Simple provider to store temporary child data during wizard
final childCreationProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class ChildCreationScreen extends ConsumerStatefulWidget {
  const ChildCreationScreen({super.key});

  @override
  ConsumerState<ChildCreationScreen> createState() => _ChildCreationScreenState();
}

class _ChildCreationScreenState extends ConsumerState<ChildCreationScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  void _handleContinue() {
    if (_nameController.text.isNotEmpty && _ageController.text.isNotEmpty) {
      ref.read(childCreationProvider.notifier).state = {
        'name': _nameController.text,
        'age': _ageController.text,
      };
      
      // Navigate to AI Configuration Wizard (we need to create this route/screen)
      // For now, let's assume we map 'aiSmartRecommendation' or a new route to it.
      // Let's us 'aiSmartRecommendation' as a placeholder for the Wizard or create a new one.
      // Actually, I should create a new route for the wizard.
      Navigator.pushNamed(context, AppRoutes.aiConfigurationWizard); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profil de l\'enfant'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeInDown(
              child: Text(
                'Qui voulez-vous protéger ?',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 32),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Âge',
                  prefixIcon: Icon(Icons.cake_outlined),
                ),
              ),
            ),
            const Spacer(),
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: _handleContinue,
                  child: const Text('Continuer'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
