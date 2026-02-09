import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_provider.dart';
import '../../data/repositories/children_repository.dart';
import '../../domain/entities/child.dart';

final childrenRepositoryProvider = Provider<ChildrenRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ChildrenRepository(apiService);
});

final childrenProvider = FutureProvider<List<Child>>((ref) async {
  final repository = ref.watch(childrenRepositoryProvider);
  return await repository.getChildren();
});
