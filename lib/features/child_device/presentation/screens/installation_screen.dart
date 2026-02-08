import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_theme.dart';

class InstallationScreen extends StatefulWidget {
  const InstallationScreen({super.key});

  @override
  State<InstallationScreen> createState() => _InstallationScreenState();
}

class _InstallationScreenState extends State<InstallationScreen> {
  final String _installLink = "https://guardian.app/install/u/8923-3321";

  void _copyLink() {
    Clipboard.setData(ClipboardData(text: _installLink));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Lien copié dans le presse-papier')),
    );
  }

  void _shareLink() {
    // Mock Share
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ouverture du menu de partage...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Installer sur l\'appareil enfant'),
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
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.phone_iphone, size: 80, color: AppTheme.primaryBlue),
              ),
            ),
            const SizedBox(height: 32),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: Text(
                'Dernière étape !',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 16),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Text(
                'Envoyez ce lien sur l\'appareil de votre enfant pour installer la protection.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.textGrey),
              ),
            ),
            const SizedBox(height: 48),
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _installLink,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.textDark),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: _copyLink,
                      color: AppTheme.primaryBlue,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: _shareLink,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Icon(Icons.share),
                       SizedBox(width: 8),
                       Text('Partager le lien'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
              FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: TextButton(
                onPressed: () {
                   Navigator.pop(context);
                },
                child: const Text('Je ferai ça plus tard'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
