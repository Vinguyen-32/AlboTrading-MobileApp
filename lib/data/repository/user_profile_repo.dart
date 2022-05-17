import 'package:get/get.dart';
import 'package:plant_trading_app/data/api/api_client.dart';

class UserProfileRepo extends GetxService {
  final ApiClient apiClient;
  UserProfileRepo({required this.apiClient});

  Future<Response> getUserProfileData() async {
    return await apiClient.getData("http://localhost:3000/");
  }
}