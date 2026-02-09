import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/children_provider.dart';

class LinkChildScreen extends ConsumerStatefulWidget {
  const LinkChildScreen({super.key});

  @override
  ConsumerState<LinkChildScreen> createState() => _LinkChildScreenState();
}

class _LinkChildScreenState extends ConsumerState<LinkChildScreen> {
  final _idController = TextEditingController();
  bool _isLoading = false;

  void _linkChild() async {
    if (_idController.text.isEmpty) return;
    setState(() => _isLoading = true);
    try {
      await ref.read(childrenRepositoryProvider).linkChild(_idController.text);
      ref.invalidate(childrenProvider);
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Erreur: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lier un enfant')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text('Entrez l\'ID affiché sur l\'appareil de votre enfant.'),
            const SizedBox(height: 24),
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'ID Enfant'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _linkChild,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Lier'),
            ),
          ],
        ),
      ),
    );
  }
}
