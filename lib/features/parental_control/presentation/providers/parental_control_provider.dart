import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_provider.dart';
import '../../data/repositories/parental_control_repository.dart';
import '../../domain/entities/profile_aggregate.dart';

final parentalControlRepositoryProvider =
    Provider<ParentalControlRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ParentalControlRepository(apiService);
});

final parentalProfileProvider =
    FutureProvider.family<ProfileAggregate, String>((ref, childId) async {
  final repository = ref.watch(parentalControlRepositoryProvider);
  return await repository.getProfile(childId);
});
