import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../routes.dart';
import 'child_creation_screen.dart';
import '../../../dashboard/presentation/providers/children_provider.dart';

class AiConfigurationWizardScreen extends ConsumerStatefulWidget {
  const AiConfigurationWizardScreen({super.key});

  @override
  ConsumerState<AiConfigurationWizardScreen> createState() => _AiConfigurationWizardScreenState();
}

class _AiConfigurationWizardScreenState extends ConsumerState<AiConfigurationWizardScreen> {
  int _step = 0;
  
  // Mock configuration Data
  double _screenTime = 2.0; // hours
  bool _blockSocial = true;
  bool _blockAdult = true;

  void _finishSetup() {
    // Save everything
    final childData = ref.read(childCreationProvider);
    final name = childData['name'] as String? ?? 'Child';
    final ageStr = childData['age'] as String? ?? '0';
    final age = int.tryParse(ageStr) ?? 0;
    
    // Add child to global state
    ref.read(childrenProvider.notifier).addChild(name, age);
    
    // Select the new child (optional, but good UX)
    // For now simplistic approach
    
    // Navigate to Dashboard
    Navigator.pushReplacementNamed(context, AppRoutes.multiChildDashboard);
  }

  @override
  Widget build(BuildContext context) {
    final childData = ref.read(childCreationProvider);
    final childName = childData['name'] ?? 'Votre enfant';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Configuration IA'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (_step > 0) {
              setState(() => _step--);
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_step + 1) / 3,
              backgroundColor: AppTheme.primaryBlue.withOpacity(0.1),
              color: AppTheme.secondaryPurple,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: _buildStepContent(childName),
            ),
            SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (_step < 2) {
                    setState(() => _step++);
                  } else {
                    _finishSetup();
                  }
                },
                child: Text(_step == 2 ? 'Terminer' : 'Suivant'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent(String name) {
    switch (_step) {
      case 0:
        return FadeInRight(
          key: const ValueKey(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Temps d\'écran quotidien',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                'Combien de temps $name peut-il passer sur son appareil ?',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.textGrey),
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  const Icon(Icons.access_time, color: AppTheme.primaryBlue),
                  const SizedBox(height: 16),
                  Text(
                    '${_screenTime.toStringAsFixed(1)} heures',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Slider(
                value: _screenTime,
                min: 0.5,
                max: 8.0,
                divisions: 15,
                onChanged: (val) => setState(() => _screenTime = val),
              ),
            ],
          ),
        );
      case 1:
         return FadeInRight(
          key: const ValueKey(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filtrage de contenu',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                'L\'IA bloquera automatiquement les contenus inappropriés.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.textGrey),
              ),
              const SizedBox(height: 32),
              SwitchListTile(
                title: const Text('Bloquer Contenu Adulte'),
                value: _blockAdult,
                onChanged: (val) => setState(() => _blockAdult = val),
              ),
              SwitchListTile(
                title: const Text('Bloquer Réseaux Sociaux'),
                value: _blockSocial,
                onChanged: (val) => setState(() => _blockSocial = val),
              ),
            ],
          ),
        );
      case 2:
        return FadeInRight(
          key: const ValueKey(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                   color: Colors.green.withOpacity(0.1),
                   shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle, size: 80, color: Colors.green),
              ),
              const SizedBox(height: 32),
              Text(
                'Tout est prêt !',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Le profil de $name est configuré. Vous pourrez ajuster ces règles à tout moment.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.textGrey),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
