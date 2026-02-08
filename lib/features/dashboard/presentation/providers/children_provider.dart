import 'package:flutter_riverpod/flutter_riverpod.dart';

class Child {
  final String id;
  final String name;
  final int age;
  final String? imageUrl;
  final bool isProtected;

  Child({
    required this.id,
    required this.name,
    required this.age,
    this.imageUrl,
    this.isProtected = true,
  });
}

class ChildrenNotifier extends StateNotifier<List<Child>> {
  ChildrenNotifier() : super([
    // Mock initial child for demo if needed, or empty
    Child(id: '1', name: 'Léo', age: 10, isProtected: true),
  ]);

  void addChild(String name, int age) {
    state = [
      ...state,
      Child(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        age: age,
      ),
    ];
  }
}

final childrenProvider = StateNotifierProvider<ChildrenNotifier, List<Child>>((ref) {
  return ChildrenNotifier();
});

final selectedChildIdProvider = StateProvider<String?>((ref) {
  final children = ref.watch(childrenProvider);
  return children.isNotEmpty ? children.first.id : null;
});
