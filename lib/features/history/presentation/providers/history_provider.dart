import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_provider.dart';
import '../../data/repositories/history_repository.dart';
import '../../domain/entities/history_event.dart';

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return HistoryRepository(apiService);
});

final historyProvider =
    FutureProvider.family<List<HistoryEvent>, String>((ref, childId) async {
  final repository = ref.watch(historyRepositoryProvider);
  return await repository.getHistory(childId);
});
