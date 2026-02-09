import '../../../../core/network/api_config.dart';
import '../../../../core/network/api_service.dart';
import '../../domain/entities/child.dart';

class ChildrenRepository {
  final ApiService _apiService;

  ChildrenRepository(this._apiService);

  Future<List<Child>> getChildren() async {
    final response = await _apiService.get(ApiConfig.myChildren);
    final List<dynamic> childrenJson = response.data['children'];
    return childrenJson.map((json) => Child.fromJson(json)).toList();
  }

  Future<void> linkChild(String childId) async {
    await _apiService.post(ApiConfig.linkChild, data: {'childId': childId});
  }
}
