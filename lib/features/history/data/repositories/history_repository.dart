import '../../../../core/network/api_config.dart';
import '../../../../core/network/api_service.dart';
import '../../domain/entities/history_event.dart';

class HistoryRepository {
  final ApiService _apiService;

  HistoryRepository(this._apiService);

  Future<List<HistoryEvent>> getHistory(String childId) async {
    final response = await _apiService.get(ApiConfig.history(childId));
    final List<dynamic> eventsJson = response.data;
    return eventsJson.map((json) => HistoryEvent.fromJson(json)).toList();
  }
}
